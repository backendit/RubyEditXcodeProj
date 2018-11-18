#!/usr/bin/ruby
# 公司前同事写的，根据不同的bundle ID来判断是否应该设置扩展

require 'xcodeproj'  
path = ARGV[0]    # 工程的全路径  
identifier = ARGV[1]
#puts project_path
#project_path = "/Users/style/WorkSpace/new/SocialOAClient/"
#project_path = "../exoa_mobile.xcodeproj"
entitlementsPath = "#{path}/iExOA.entitlements"
project_path = "#{path}/exoa_mobile.xcodeproj" 
project = Xcodeproj::Project.open(project_path)  

project.save()

puts "111"
if identifier == nil then
	identifier = "iEXMessage"
end

puts "test 0000000000000"
puts identifier
puts "test 0000000000000"

if	identifier == "iEXMessage" then 
	iEXOAProductBundleIdentifier = "com.excellence.iEXMessage"
	shareProductBundleIdentifier = "com.excellence.iEXMessage.exShareExtension"
	codeSignIdentityAny = "iPhone Distribution"
elsif identifier == "iExOA" then 
	iEXOAProductBundleIdentifier = "com.excellence.iExOA"
	shareProductBundleIdentifier = "com.excellence.iExOA.exShareExtension"
#	codeSignIdentityAny = "iPhone Developer"
	codeSignIdentityAny = "iPhone Distribution"
end

#puts project.targets

willAddTarget = nil

shareExtensionTarget = nil 

project.targets.each do |target|
	if target.display_name == "iExOA" then
		willAddTarget = target
	elsif target.display_name == 'exShareExtension' then
		shareExtensionTarget = target
	end 
end 

puts project.targets

willAddTarget.build_configurations.each do |buildConfiguration|
	if buildConfiguration.name == 'Release' then 
		puts "add %^&*888888888888"
	 	buildConfiguration.build_settings["CODE_SIGN_IDENTITY[sdk=iphoneos*]"] = codeSignIdentityAny
	 	buildConfiguration.build_settings["PRODUCT_BUNDLE_IDENTIFIER"] = iEXOAProductBundleIdentifier
	end
end

if identifier == "iEXMessage"  then 
	shareExtensionTarget.build_configurations.each do |buildConfiguration|
		if buildConfiguration.name == 'Release' then 
			puts "setting %^&*888888888888"
		 	buildConfiguration.build_settings["PRODUCT_BUNDLE_IDENTIFIER"] = shareProductBundleIdentifier
			buildConfiguration.build_settings["CODE_SIGN_ENTITLEMENTS"] = "iExOA.entitlements"
			
#			entitlementsPlist = Xcodeproj::Plist.read_from_path(entitlementsPath)
#			entitlementsPlist["com.apple.security.application-groups"] = ["group.com.excellence"]
#			Xcodeproj::Plist.write_to_path(entitlementsPlist,entitlementsPath)
#			entitlementsPlist = Xcodeproj::Plist.read_from_path(entitlementsPath)
#			puts entitlementsPlist

		end
	end
	
	willAddTarget.add_dependency(shareExtensionTarget) 

	project.files.each do |file|
		if file.explicit_file_type == "wrapper.app-extension" then 
		if file.display_name == "exShareExtension.appex" then
			puts "start"
			puts file.display_name
			puts "end"
				willAddTarget.build_phases.each do |phase|
					if	phase.display_name == "Embed App Extensions" then
						phase.add_file_reference(file)

					end
				end
				end
				puts file
			end 
		end 
end 


project.save()

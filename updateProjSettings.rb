require 'xcodeproj'

#打开项目工程.xcodeproj
project_path = './RubyEditXcodeProj.xcodeproj'
project = Xcodeproj::Project.open(project_path)

# 查询有多少个target
project.targets.each do |target|
	puts target.name
end

# 遍历配置
project.targets[0].build_configurations.each do |config|
	puts config.name   # Debug / Release
	#获得build settings
	build_settings = config.build_settings
	#build_settings是一个哈希，里面是一个个配置
	build_settings.each do |key,value|
		print key, " == ", value, "\n"
		# 可在这里进行设置证书等操作，常用的如下：
		# 比如修改bundle id ,测试
		# build_settings[key] = "com.test.demo"
		# 设置授权文件
		build_settings["CODE_SIGN_ENTITLEMENTS"] = "xxx.entitlements"
		# 设置签名 iPhone Distribution / iPhone Developer
		build_settings["CODE_SIGN_IDENTITY[sdk=iphoneos*]"] = "iPhone Distribution"
		# ..... 其他的视情况(需求)去查找API

	end

end

# 在工程中引入Framework .a文件 或 bundele文件  ####################


# 找到需要操作的target
targetIndex = 0
project.targets.each_with_index do |target,index|
	if target.name == ""
		targetIndex = index
	end
end

# target
target = project.targets[targetIndex]

# 添加 .framework引用
file_ref = project.frameworks_group.new_file("xxxPath/xx.framework")
target.frameworks_build_phases.add_file_reference(file_ref)

# 新建一个copy files，并把framework添加进去
target.new_copy_files_build_phases("名字")

# 可能有多个copy files build phases，遍历找到对应的
target.copy_files_build_phases.each do |item|
	if item.name = "名字"
		item.add_file_reference(file_ref)
	end
	# #设置copy file buldphase中的Destination选项
	item.dst_subfolder_spec = "10"
	# #勾上code sign on copy选项
	item.files[0].settings = Hash.new
	item.files[0].settings["ATTRIBUTES"] = ["CodeSignOnCopy"] 

end


# 最后保存文件
project.save
#!/usr/bin/ruby
#coding=utf-8
# -*- coding: UTF-8 -*-

=begin
 本文件为学习Ruby的基本练习，不包含高级知识
=end

# 使用终端
# $ irb
# 2.5.1 :001 > puts "hello world"
# hello world
#  => nil 

puts "hello world!"

# 输出中文
puts "你好，世界!"

# 一、基本语法  +++++++++++++++++++++++++++++++++++++++++

# "Here Document" 是指建立多行字符串。在 << 之后，
# 您可以指定一个字符串或标识符来终止字符串，且当前行之后直到终止符为止的所有行是字符串的值.

print <<EOF
	第一行
	这是多行字符串
EOF

print <<`EOC`   # 执行命令
	echo hi there
	echo '使用`EOC`代表执行命令'
EOC

print <<"foo",<<"bar"  # 可进行堆叠
	I said foo.
foo
	I said bar.
bar


# 使用BEGIN语句，在程序运行之前被调用（注意是程序运行之前），还有个END语句，在程序结尾被调用

puts "主Ruby程序"

BEGIN {
	puts "初始化 Ruby 程序"
}

END {
	puts "Ruby 程序已停止"
}

# 注释，一般使用#可注释，也可使用如下的 =begin/=end（打了=begin，自动补全了）

=begin
这里也是注释，相当于块注释吧	
rescue Exception => e
	
=end


# 二、数据类型  +++++++++++++++++++++++++++++++++++++++++
=begin
	
支持的数据类型： Number、String、Ranges、Symbols，以及true、false和nil，  Array,Hash

=end

# 算术操作

# 指数运算
puts 2**(1/4) #1与4的商为0，然后2的0次方为1 


# 字符串类型

#序列 #{ expr } 替换任意Ruby表达式的值为一个字符串
name = "Ruby"
puts "#{name+",is Good!"}"


# 数组（重要）*********

ary = ["haha","2333","hehe"]
puts ary[1]
ary[1] = "23334"
puts ary[1]

#数组的遍历
ary.each do |i|
	puts i
end



# 哈希类型（重要），也就是字典*********

#定义一个哈希及遍历它
hsh = {"red" => 0xf00,"green" => 0x0f0,"blue" => 0x00f}
hsh.each do |key,value|
	print key, " is ", value, "\n"
end



# 范围类型，表示一个区间；设置一个开始值和结束值；
# 使用 s..e(左闭右闭) 和 s...e(左闭右开，即不包含结束值) 或通过Range.new来构造

(1...5).each do |n|
	print n, ' '
end




# #!/usr/bin/ruby -w 警告
# 三、类和对象；如何定义一个类、实例、方法，类变量、实例变量、成员变量以及局部变量、全局变量如何定义 ++++++++++++++++++

# 全局变量，以美元符号开始（$），可垮类访问
$globle_var = "This is Person!"

# 定义一个类
class Person
	# 使用 @@ 定义类变量，属于类，继承链中共享使用
	@@no_of_customers = 0

	# 大写字母开头，表示 常量
	VAR1 = 99
	VAR2 = 100

	# 初始化方法
	def initialize(name,height,weight)
		# 实例变量，使用 @ 定义
		@name = name
		@height = height
		@weight = weight
	end

	# 使用def声明一个方法
	def hello()
		#成员变量，总是以小写字母或_开始
		numberOne = 1
		_numberTwo = 2
		puts "hello,Person"
	end

	def reduce_weight()
		puts "开始减肥啦..."
		@weight -= 5
	end

	def info()
		# 打印常量
		puts "常量是：#{VAR2}"
		# 打印实例变量的值，前面放置符号 #,注意要在双引号里面
		print "name:#@name height:#@height weight:#@weight","kg\n"
	end

end

# 创建一个对象，使用 类. new
person = Person. new("test_miao_mi","173cm",68)

person.hello()
# 减肥
person.reduce_weight
# 输出信息
person.info

=begin 伪变量
	self: 当前方法的接收器对象。
	true: 代表 true 的值。
	false: 代表 false 的值。
	nil: 代表 undefined 的值。
	__FILE__: 当前源文件的名称。
	__LINE__: 当前行在源文件中的编号
=end




# 四、运算符 

# 加减乘除取模，比较，指数运算(**)等,运算可以认为是方法调用，a + b 被解释为 a.+(b)，其中指向变量 a 的 + 方法被调用


# 联合运算符 <==>，两个数比较，返回0 ，1 ，-1

# ====，(1...10) === 5 返回 true

# .eql?  ，比较是否具有相同的类型及相同的值

# equal? ，比较是否具有相同的对象id


# 并行运算
a, b, c = 10, 20, 30

# 位运算符，跟其他语言是一样的，&(与) ，|(或) ，^(异或) , ~(反转), <<(左移) , >>(右移)


# 逻辑运算符 AND OR not && || !


# 三目运算符  ?:

# 范围运算符 ，1..10 : 1到10 ，1...10，1到9

# defined? ,判断传递的表达式是否已定义
defined? a
defined? info

# 常量解释符 ，两个冒号 :: ，引用类和模块中的常量,
# 如果 :: 前的表达式为类或模块名称，则返回该类或模块内对应的常量值；如果 :: 前未没有前缀表达式，则返回主Object类中对应的常量值

puts Person::VAR2
::VAR2 = 101  # 非全局变量，设置无效
puts Person::VAR2


# 五 判断  =========================
# then 可省略
x = 2
if x > 3 then
	puts "x 大于 3"
elsif x <= 2 and x != 0 then
	puts "x 是 2"
else
	puts "无法得知。"
end


# code if condition，如果condition为真则执行code
puts "1 < 2" if 1 < 2

# code unless conditional，如果condition为假则执行code
puts "1 > 2 是假的" unless 1 > 2

# unless修饰符

x = 1
unless x < 0 # 假的时候会执行
	puts "1 不小于0"
else
	puts "1 大于0"
end


# case 语句，用 === 比较when的expression
# 无case 条件时，执行when第一个为true

$g_var = 26
case $g_var
when 1..5
	puts "baby."
when 6..16
	puts "少年"
when 17..24
	puts "青年"
when 25..50
	puts "中年"
end



#六 循环  =========================

# 1，while - 语句
=begin
while conditional [do]
   code
end
=end

$start = 1
$end = 2

while $start < $end do
	puts "在循环中..#$start"
	$start += 1
end

# while - 修饰符

# 这跟上面不一样，这个至少会执行一次 do ... while
# begin
# 	puts "在循环中..#$start"
# 	$start += 1
# end while $start < $end


# 2，until，条件为假时执行，其他的跟while一毛一样

until $start > $end
	puts "until 语句"
	$start += 1
end

# 3，for
# do可省略
for i in 0..3 do
	puts "for循环 #{i}"
end

# 几乎完全等价于 each
(0..3).each do |i|
	puts "each遍历 #{i}"
end

# 4，break语句，next语句，redo语句
# break 跳出循环，next 跳出本次循环，继续下一次循环，redo 重新开始最内部循环的该次迭代，不检查循环条件
for j in 0..5 do
	if j == 2 then
		next
	end
	if j >= 4 then
		break
	end
	puts "循环的终止，#{j}"
end

# redo 将循环输出： redo 从最内部开始循环 - 0
# for a in 0..3
# 	if a < 2
# 		puts "redo 从最内部开始循环 - #{a}"
# 		redo
# 	end
# end

# retry 1)出现在rescue，从 begin 主体的开头重新开始;2)重新开始迭代调用。迭代的参数会重新评估

begin
	puts "此处的代码抛出异常"
	# k = 9 / 0;
rescue 
	puts "处理异常..."
	retry # 重新从begin开始执行
end

# 注意1.9后不支持在循环中使用retry了
for ii in 1..4 
	# retry if ii > 2  # 从新从 ii = 1开始
	puts "retry输出 - #{ii}"
end


#七 方法  =========================

# 声明一个简单的方法
def test
	
end

# 声明带参数的方法
def run (parm1,parm2)
	
end

# 声明的方法参数有默认值
def go (parm1="Ruby",parm2="hello")
	
end

# 参数列表，使用*params
def say (*params)
	puts "参数个数：#{params.length}"
	for c in 0...params.length
		puts "参数值为：#{params[c]}"
	end
end

# 方法调用-含参数
say "aa","ab","bb","cc"

# 类方法
# 方法定义在类外部，默认是private的，定义在类内部，默认是public的

# 不用实例化即可访问方法的方式

class Custom
	def testtest
		puts "testtest"
	end
	# 这样定义一个不用实例化即可访问方法的方式
	def Custom.retrun_values
		puts "测试测试。。"
	end

	# alias 为方法或全局变量起别名。别名不能在方法主体内定义
	# 如 为testtest方法定义一个 test1 的别名
	alias test1 testtest
	# undef 取消方法定义
	# undef testtest
end

Custom.retrun_values

custom = Custom. new
custom.testtest()

custom.test1

# 八，块，===============================
# block_name{
#    statement1
#    statement2
#    ..........
# }
# 块使用{}定义，包含大量代码，总是与其具有相同名称的函数调用，使用yield来调用块
def test
	puts "在方法test内"
	yield
	puts "回到了在方法test内"
end

# 声明一个块
test {
	puts "在块test内"
}

# 向块内传递参数
def test1
	puts "在方法test内"
	yield 998,1000
	puts "回到了在方法test内"
end

# 声明一个块,并接收参数
# test1 {
# 	|i| puts "在块test #{i} 内"
# }
# 传递多个参数
test1 {
	|a,b| puts "在块test #{a}，#{b} 内"
}

# 块 作为参数传递并调用,有*方法列表时，&放到最后
def test2 (&blcock)
	blcock.call
end

test2 {puts "hi , Ruby"}


# 九 模块- Module
# 是一种把方法、类和常量组合在一起的方式
# 好处
# 1.模块提供了一个命名空间和避免名字冲突。
# 2.模块实现了 mixin 装置
# 定义一个命名空间，相当于一个沙盒，不会与其他类中的方法和常量产生冲突
# 但其不能实例化，没有子类，只能被另一个模块定义

module Moral
	def Moral.sayHi(x)
		puts "模块中的方法"
	end
end
#调用模块中的方法
Moral.sayHi("dd")

# require ，引入其他的.rb文件（加载模块文件）类似于Java的import

$LOAD_PATH << '.'
require 'support'

# 使用 $LOAD_PATH << '.' 让 Ruby 知道必须在当前目录中搜索被引用的文件。
# 如果不想使用 $LOAD_PATH，那么您可以使用 require_relative 来从一个相对目录引用文件

# include 语句，配合使用require，引入其他文件后，在类中include 模块使用

class Decade
# 导入模块
include Restart
	def inde
		# 访问模块的常量
		puts "重启所需:#{Restart::VAR_CONST}"
	end
end

decade = Decade.new
decade.inde
# 调用模块方法
Restart.run

# Mixins ，即在一个类中，可引入多个模块，调用多个模块的方法
module A
   def a1
   end
   def a2
   end
end
module B
   def b1
   end
   def b2
   end
end
 
class Sample
include A
include B
   def s1
   end
end
 
samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1
# Sample 相当于继承了多个模块，或者是多重继承

# 十，字符串 =================================


# 在双引号字符串中我们可以使用 #{} 井号和大括号来计算表达式的值

# 转义，\\ \"  ，\n,\t,\s等等

# %q  %Q 引导规则
desc1 = %Q{Ruby 的字符串可以使用 '' 和 ""。}
desc2 = %q|Ruby 的字符串可以使用 '' 和 ""。|
 
puts desc1
puts desc2

# String 方法

myStr = String.new("THIS ME")
# 如果是downcase!，则原字符串也会变成小写；否则是返回小写后的副本
foo = myStr.downcase
puts "#{foo}"
puts "#{myStr}"

# 解压指令 a.unpack

# 其他的一些方法就不一一写了，用到时再查询即可


# 十一，数组 =================================

# names = Array.new
# 声明大小
# names = Array.new(20)
# 给每个元素赋值
# names = Array.new(4,"bbc")
# 通过计算结果填充
names = Array.new(10) { |i| i = i + 2 }

# nums = Array[1,2,3,4]

nums = Array(0..6)
num = nums.at(3)

puts "#{num}"

# 压缩指令 a.pack

# 更多内建命令查阅API


# 十二，哈希，类似 "key" => "value" 这样的键值对集合 ==============

months = Hash.new
# 带默认值
months = Hash.new("month")

H = Hash["a" => 100, "b" => 200]
 
puts "#{H['a']}"
puts "#{H['b']}"

puts "#{H.keys}"

# 通过计算结果
# mm = Hash.new { |hash, key| hash[key] =  }

# 迭代，使用each

# 更多哈希内建命令查阅API


# 十三，日期 & 时间

time = Time.new

time2 = Time.now

puts "当前时间1：" + time.inspect
puts "当前时间2：#{time2}"

puts "当前时间 : " + time.inspect
puts time.year    # => 日期的年份
puts time.month   # => 日期的月份（1 到 12）
puts time.day     # => 一个月中的第几天（1 到 31）
puts time.wday    # => 一周中的星期几（0 是星期日）
puts time.yday    # => 365：一年中的第几天
puts time.hour    # => 23：24 小时制
puts time.min     # => 59
puts time.sec     # => 59
puts time.usec    # => 999999：微秒
puts time.zone    # => "UTC"：时区名称

values = time.to_a

puts "valueS:#{values}"
puts Time.utc(*values)

# 返回从纪元以来的秒数
time3 = Time.now.to_i  
# 把秒数转换为 Time 对象
Time.at(time3)
# 返回从纪元以来的秒数，包含微妙
time3 = Time.now.to_f


# 时间格式化 
puts time.to_s
puts time.ctime
puts time.localtime
puts time.strftime("%Y-%m-%d %H:%M:%S")

# 十四。范围，Range

# (0..5)
# (0...5)
# ('a','d')

range1 = (0..5).to_a
range2 = ('a'..'d').to_a

puts "#{range1}"
puts "#{range2}"

digits = 0..9

# 是否包含 5
puts digits.include?(5)
min = digits.min
puts "最小值为 #{min}"
max = digits.max
puts "最大值为 #{max}"
# 过滤不符合条件的
ret = digits.reject {|i| i < 5 }
puts "不符合条件的有 #{ret}"
# 遍历
digits.each do |digit|
   puts "在循环中 #{digit}"
end

# 十五，迭代器

# each

ary = [1,2,3,4]
ary.each do |i|
	puts "i = #{i}"
end

# collect

ary1 = [1,2,3,4]
ary2 = Array.new
# clone，完全复制，得到一个新数组
ary2 = ary1.collect { |i| i }

puts "#{ary2}"


# map的迭代器
hs = Hash["aa" => 100, "bb" => 200]
hs.each do |k,v|
	puts "key:#{k},value:#{v}"
end
# 还可以直接这样
hs.each{|i,v| puts v}

# 十六，文件的输入和输出

# 1,pust 屏幕输出, 自动换行

# 2,get 获取屏幕用户的输入

# puts "请输入一个数字："
# val = gets
# puts "您输入的是：#{val}"

# 3,putc , 依次输出一个字符

t = "Hello"

putc t

# 4,print,不会自动换行,光标定位在同一行

print t + "\n"


# 文件的读写

# aFile = File.new("filename", "mode")
#    # ... 处理文件
# aFile.close

# File.open 可与块关联，new不能

# aFile = File.open("","")

# 文件打开模式：r:只读，r+：读写，w:只写，w+:读写，a:只写，a+:读写

# 使用sysread 读

# aFile = File.open("fileTxt.txt", "r") { |file|  }
aFile = File.open("fileTxt.txt", "r+")

if aFile
	# puts aFile.sysread(10)
else
	puts "不能打开文件！"
end

# 使用syswrite 写
#  each_byte 是个可以迭代字符串中每个字符
if aFile
	puts aFile.syswrite("my name is xxx")
	# 
	aFile.rewind
	# aFile.each_byte{|ch| putc ch;putc ?.}
else
	puts "不能打开文件！"
end


# IO.readlines 逐行返回文件内容

ars = IO.readlines("fileTxt.txt")
puts ars[1]

# IO.foreach ,也是逐行返回，但其能与块关联
ars1 = IO.foreach("fileTxt.txt"){|block| puts block}

# rename 和 delete 方法重命名和删除文件

# file = File.rename("fileTest.txt","fileTxt.txt")

# 操作完文件后，关闭文件
# aFile.close

# 删除文件
# File.delete("fileTxt1.txt")

# 文件的模式和所有权，熟悉Linux应该知道，rwx(对应：4 2 1) 777 所有者|所属组|本用户
# file.chmod( 0755 )


# 查询文件是否存在

puts File.file?( "text.txt" )

file1 = File.open("fileTxt.txt") if File::exists?("fileTxt.txt")

# 是否是一个目录

puts File::directory?("/usr/local")
puts File::directory?("test2.txt")


# 是否有读、写 执行权限

puts File.readable?( "fileTxt.txt" ) 
puts File.writable?( "fileTxt.txt" )   
puts File.executable?( "fileTxt.txt" ) 

# 文件大小
puts File.size?( "fileTxt.txt" ) 

# 检查文件类型
puts File::ftype("fileTxt.txt")


# 文件的创建 修改或最后访问时间

puts "创建时间：#{File::ctime("fileTxt.txt")}"
puts "修改时间：#{File::mtime("fileTxt.txt")}"
puts "最后访问时间：#{File::atime("fileTxt.txt")}"


# 目录

# 改变当前目录
# Dir.chdir("/usr/bin")

# 查看当前目录
puts Dir.pwd

# 获取指定目录内的文件和目录列表 Dir.entries,返回一个数组
# puts Dir.entries(Dir.pwd)
# foreach提供了相同的功能
Dir.foreach(Dir.pwd) do |entry|
	puts entry
end
# 一个更简洁的方式
puts Dir["/Users/maojianyu/develop/RubyEditXcodeProj/*"]

# 创建目录
Dir.mkdir("testDir")

# 删除目录
Dir.delete("testDir")

# 创建临时目录 & 文件
# 方法一
require 'tmpdir'
tname = File.join(Dir.tmpdir,"ttFile")
puts tname
tmFile = File.new(tname,"w")
tmFile.puts "这是一个临时文件"
tmFile.close
File.delete(tname)
# 方法二
require 'tempfile'
f = Tempfile.new("ttmFile")
f.puts "Hi temp FIle"
puts f.path
f.close

# File的内建方法可阅读API文档

# Dir的内建方法可阅读API文档


# 最后一个内容 ，处理异常

begin    # 开始
	# 这里执行代码，若抛出异常，则被rescue捕获

rescue [ExceptionType = StandardException] # 指定的类型异常
	$i  # 异常信息
	$@  # 异常出现的代码位置
else # 其余异常
	# 处理其他非指定异常

	retry  # 把控制转移到begin开头，谨慎使用，避免无限处理
ensure   # 不管有没有异常，都会执行，相当Java中finally
	
end     #  结束


# 使用raise 抛出异常

raise 
raise "Error Message"
raise ExceptionType,"Error Message"
raise ExceptionType,"Error Message" condition  # 添加额外的条件

begin
	puts 'I am before the raise.'  
    raise 'An error has occurred.'  
    puts 'I am after the raise.'
rescue Exception => e
	puts e.message
	puts e.backtrace.inspect
	puts 'I am rescued.'  
end
puts 'I am after the begin block.'

begin 
   #.. 过程 
   #.. 抛出异常
rescue 
   #.. 处理错误
else
   #.. 如果没有异常则执行
ensure 
   #.. 最后确保执行
   #.. 这总是会执行
end

# 进阶，Catch 和 Throw，需要在正常处理时跳出一些深层嵌套的结构

# 当用输入 ！ 时终止交互

def promptAndGet(prompt)
	print prompt
	res = readlines.chomp
	# 当输入 ！时抛出错误
	throw :quitRequested if res == "!"
	return res
end

# 捕获错误，并处理
catch :quitRequested do
   name = promptAndGet("Name: ")
   age = promptAndGet("Age: ")
   sex = promptAndGet("Sex: ")
   # ..
   # 处理信息
end
promptAndGet("Name:")


# 高级，Exception

# Interrupt
# NoMemoryError
# SignalException
# ScriptError
# StandardError
# SystemExit

class FileSaveError < StandardError
   attr_reader :reason
   def initialize(reason)
      @reason = reason
   end
end
# 用到上面的异常：
File.open(path, "w") do |file|
begin
    # 写出数据 ...
rescue
    # 发生错误
    raise FileSaveError.new($!)
end
end


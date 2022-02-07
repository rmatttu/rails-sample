require "date"
require "json"
require 'uri'
require 'net/http'

start = DateTime.now

puts "$0: #{$0}"
ARGV.each_with_index do |arg, i|
  puts "ARGV[#{i}]: #{arg}"
end


# nethttp.rb
uri = URI('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')
res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)
puts res.body.class

jsonData = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
puts jsonData.class # Hash
puts jsonData&.[]("url")
puts nil&.[]("url")

test1 = {"a" => "b"}
test2={s: "b"} # { :s => b, ... } と同じ。キーがシンボルの場合の省略した書き方
test3={"a+": "test" } # { :"a+" => b, ... } と同じ。上の表現に空白や記号を含めたい場合
testArray = {a: :x}
test5={s: :b}
puts test2[:s]
puts test5[:s].class
puts testArray[:a]


start = DateTime.now    # 今の日時(2020-09-05 17:08:37 +0900)
DateTime.now - 1       # 昨日

input = DateTime.new(2020, 9, 5, 17, 8, 37)
date = DateTime.parse('2020-09-05T17:08:37')
  date += 10
  date - input                 # 10
  date.year                    # 2020
  date.strftime('%a')          # "Sat"
  date.strftime("%Y年%m月%d日") # 2020年9月5日

# sleep(0.5)
endDatetime = DateTime.now

puts "start: " << start.strftime("%Y-%m-%d_%H-%M-%S")
puts "end: " << endDatetime.strftime("%Y-%m-%d_%H-%M-%S")
STDERR.puts endDatetime.to_time-start.to_time

class MyClass
  def initialize
    @instance_var = "abc"
    @name="hello"
    p "initialize: #{@instance_var}"
  end

  def foo(arg)
    "foo called with arg #{arg}"
    # return は省略可
  end

  def this_is_instance_method
    p "this_is_instance_method: #{@instance_var}"
  end

  def self.this_is_static_method
    # @instance_var => nil
    p "this_is_static_method: #{@instance_var}"
  end
end

p "---------------"
foo = MyClass.new
result = foo.foo("this is test")
result = foo.foo "this is test" # 省略形
p result
foo.this_is_instance_method()
foo.this_is_instance_method # 省略形
MyClass.this_is_static_method

my_list = [
  "hello",
  "abcd",
  123,
]

p my_list
result = my_list.push "world!"
my_list.push foo.foo "chain"
my_list.push foo.foo "chain1" << " and chain2"
p my_list
p my_list << "add word to list, and print"
p my_list.join ", "

p foo

class Score
  def initialize(user_id, score)
    @user_id = user_id
    @score = score
  end

  # 演算子のオーバーロード
  def +(other)
    if !other.instance_of?(self.class)
    end
    self.score + other.score
  end

  # アクセスメソッド（プロパティっぽいもの）
  attr_reader :score
end

score1 = Score.new(1, 100)
score2 = Score.new(2, 123)
p score1
p score2
p score1 + score2

require 'minitest/autorun'
# require './lib/rgb'
# $:.unshift File.dirname(__FILE__)  # ロードパスにカレントディレクトリを追加
# https://qiita.com/komattio/items/260f79f6299e0ecae935
# http://blog.ruedap.com/2011/05/31/ruby-require-load-path
$:.unshift './lib'  # ロードパスにカレントディレクトリを追加
require 'rgb.rb'

class RgbTest < Minitest::Test
  def test_to_hex
    assert_equal '#000000', to_hex(0, 0, 0)
    assert_equal '#ffffff', to_hex(255, 255, 255)
    assert_equal '#043c78', to_hex(4, 60, 120)
    # vagrant@ubuntu-xenial:~/project/cherry_ruby/ruby-book$ irb
    # >> 200.to_s(16).rjust(2, '0')
    # => "c8"
    # >> 150.to_s(16).rjust(2, '0')
    # => "96"
    # >> 100.to_s(16).rjust(2, '0')
    # => "64"
    assert_equal '#c89664', to_hex(200, 150, 100)
  end

  def test_to_ints
    assert_equal [0, 0, 0], to_ints('#000000')
    assert_equal [255, 255, 255], to_ints('#ffffff')
  end
end

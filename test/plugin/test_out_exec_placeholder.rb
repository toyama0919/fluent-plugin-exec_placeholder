require 'helper'
class ExecPlaceholderOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG = %[

  ]

  def create_driver(conf = CONFIG, tag='test')
    Fluent::Test::OutputTestDriver.new(Fluent::ExecPlaceholderOutput, tag).configure(conf)
  end

  def test_configure
    d = create_driver(CONFIG + "\noutput_type json")
    assert_equal :json, d.instance.output_type

    assert_raise(Fluent::ConfigError) do
      d = create_driver(CONFIG)
    end
  end

  def test_emit
    d1 = create_driver(CONFIG, 'input.access')
    d1.run do
      d1.emit({'domain' => 'www.google.com', 'path' => '/foo/bar?key=value', 'agent' => 'Googlebot', 'response_time' => 1000000})
      d1.emit({'domain' => 'news.google.com', 'path' => '/', 'agent' => 'Googlebot-Mobile', 'response_time' => 900000})
    end
    emits = d1.emits
    assert_equal 5, emits.length
  end
end

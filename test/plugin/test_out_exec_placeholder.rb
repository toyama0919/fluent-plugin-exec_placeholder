require 'helper'
class ExecPlaceholderOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  def create_driver(conf = CONFIG, tag='test')
    Fluent::Test::OutputTestDriver.new(Fluent::ExecPlaceholderOutput, tag).configure(conf)
  end

  def test_configure
    d = create_driver(%[
      command /etc/init.d/httpd restart
    ])
    assert_equal "/etc/init.d/httpd restart", d.instance.command
  end

  def test_emit
    d1 = create_driver(%[
      command echo ${tag}
      ],
      'input.access'
    )
    d1.run do
      d1.emit({'domain' => 'www.google.com', 'path' => '/foo/bar?key=value', 'agent' => 'Googlebot', 'response_time' => 1000000})
      d1.emit({'domain' => 'news.google.com', 'path' => '/', 'agent' => 'Googlebot-Mobile', 'response_time' => 900000})
    end
  end
end

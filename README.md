# fluent-plugin-exec_placeholder [![Build Status](https://secure.travis-ci.org/toyama0919/fluent-plugin-exec_placeholder.png?branch=master)](http://travis-ci.org/toyama0919/fluent-plugin-exec_placeholder)

ExecPlaceholder plugin for fluentd

## Examples

#### setting
```
<match {command,ping_port}.presto.**>
  type exec_placeholder
  command /etc/init.d/presto ${message}
</match>
```

#### input

```
{ "message":"restart" }
```

#### output

```
execute `/etc/init.d/presto restart`
```


## Installation
```
fluent-gem install fluent-plugin-exec_placeholder
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Information

* [Homepage](https://github.com/toyama0919/fluent-plugin-exec_placeholder)
* [Issues](https://github.com/toyama0919/fluent-plugin-exec_placeholder/issues)
* [Documentation](http://rubydoc.info/gems/fluent-plugin-exec_placeholder/frames)
* [Email](mailto:toyama0919@gmail.com)

## Copyright

Copyright (c) 2016 toyama0919


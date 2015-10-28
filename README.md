# Itamae::Plugin::Recipe::Zabbix

Itamae recipe plugin for zabbix

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-zabbix'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-zabbix

## Usage

### Install

```ruby
include_recipe "zabbix"
include_recipe "zabbix::agent"
```

```yaml
zabbix:
  version: 2.2
  server: zabbix.example.com
  port: 10050
  hostname: local.example.com
  host_metadata:
  userparameters:
```

### Userparameters

```ruby
include_recipe "zabbix"

zabbix_userparameters "all" do
  path File.expand_path(File.dirname(__FILE__)) + "/zabbix/templates/etc/zabbix/zabbix_agentd.d/"
end
```

```yaml
zabbix:
  userparameters:
    - userparameter_hoge.conf.erb
    - userparameter_piyo.conf.erb
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/itamae-plugin-recipe-zabbix.

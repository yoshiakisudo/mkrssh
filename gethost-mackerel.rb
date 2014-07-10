#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'optparse'
require 'mackerel'

params = ARGV.getopts('', 'service:', 'role:')

service_name = params['service']
skole_name = params['role']

client = Mackerel::Client.new(:mackerel_api_key => ENV['MACKEREL_APIKEY'])

client.get_hosts(service: service_name).each do |host|
  puts "#{host.name}"
end

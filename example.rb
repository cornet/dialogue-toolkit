#!/usr/bin/env ruby

require 'rubygems'
require 'dialogue-toolkit'
require 'httparty'

sms = Dialogue::Toolkit::Sms.new('username','password')

p = {
  :recipients => '447123456789',
  :message    => 'hello world',
  :reply_path => 'SMTP:foo@example.com',
}

p sms.send(p)

#!/usr/bin/env ruby

require 'rubygems'
require 'dialogue-toolkit'

sms = Dialogue::Toolkit::Sms.new('username','password')

p = {
  :recipients => '447123456789',    # Number to send to
  :message    => 'hello world',     # Content of the message
  :reply_path => 'foo@example.com', # Where to send delivery report to
}

p sms.send(p)

# dialogue-toolkit

## About

A ruby gem to send SMS messages through the Dialogue SMS Toolkit API: http://www.dialogue.net/sms_toolkit/

## Install

    git clone git://github.com/cornet/dialogue-toolkit.git
    cd dialogue-toolkit
    rake install

## Example Usage

    #!/usr/bin/env ruby
    
    require 'rubygems'
    require 'dialogue-toolkit'
    
    sms = Dialogue::Toolkit::Sms.new('username','password')
    
    params = {
      :recipients => '447123456789',
      :message    => 'hello world',
      :reply_path => 'SMTP:foo@example.com',
    }
    
    p sms.send(params)

## References

* Dialogue SMS Toolkit [API Guide][api_guide]

 [api_guide]: http://www.dialogue.net/sms_toolkit/documents/Dialogue%20Partner%20Toolkit%20-%20API%20Developer%20Guide.pdf

## Contribute

If you would like to contribute to dialogue-toolkit then fork the project, implement your feature/plugin on a new branch and send a pull request.

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
      :recipients => '447123456789',    # Mobile number to send to
      :message    => 'hello world',     # Message content
      :reply_path => 'foo@example.com', # Where to send delivery receipt to
    }
    
    p sms.send(params)

Handling delivery receipts using [Sinatra][sinatra]

    post '/dr' do
      resp = Dialogue::Toolkit::Sms::Dr.new(request.body.read)
      if resp.delivery_report.eql? '00'
    	"Message Delivered"
      else
        "Message Failed"
       end
    end

 [sinatra]: http://www.sinatrarb.com/

## References

* Dialogue SMS Toolkit [API Guide][api_guide]

 [api_guide]: http://www.dialogue.net/sms_toolkit/documents/Dialogue%20Partner%20Toolkit%20-%20API%20Developer%20Guide.pdf

## Contribute

If you would like to contribute to dialogue-toolkit then fork the project, implement your feature/plugin on a new branch and send a pull request.

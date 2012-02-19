require 'httparty'

module Dialogue
  module Toolkit
    class Sms
      include HTTParty

      base_uri 'http://sendmsg.dialogue.net'
      headers  "Content-Type" => "application/json; charset=UTF-8"
      
      # Public: Initialize Sms session
      #
      # user - String of your API user name
      # pass - String of your API password
      def initialize(user, pass)
        @auth = {:username => user, :password => pass}
      end
      
      # Public: Send SMS message
      #
      # p - Hash containing message parameters
      #     :recipients - String or Array of mobile numbers in international
      #                   format (e.g. 447123456789)
      #     :message - String or Array of messages to send to all recipients
      #     :reply_path - String of where to send delivery receipts to.
      #                   Can be email address or URL
      #     :scheduled_for - Time or DateTime object containing time to send 
      #                      the message in 'Europe/London' timezone.
      #     :originating_address - String of the number/text you want the
      #                            message to appear from. Numbers must be
      #                            bought from Dialogue.
      #
      # Returns Array of Dialogue::Toolkit::Sms::Response objects
      def send(p)
        options = {} 

        p.each do |k,v|

          case k
          when :reply_path
            # Automatically request delivery receipt if reply path is set
            options[sym_to_param(:confirm_delivery)] = 'on'
            options[sym_to_param(k)] = v
          when :scheduled_for
            # Set timestamp correctly for :scheduled_for
            options[sym_to_param(k)] = v.strftime('%Y%m%d%H%M%S')
          else
            options[sym_to_param(k)] = v
          end

        end

        res = self.class.post('/submit_sm', :basic_auth => @auth, :body => JSON.dump(options))

        responses = []
        res['sms'].each do |r|
          responses << Dialogue::Toolkit::Sms::Response.new(r)
        end

        responses
      end

      private
      
      # Private: convert Symbol keys to String equivelents for submitting
      # to Dialogue Toolkit API
      #
      # s - Symbol option
      #
      # Examples
      #
      #   sym_to_param(:reply_path) returns 'X-E3-Reply-Path'
      #
      # Returns String of the parameter
      def sym_to_param(s)
        'X-E3-' + s.to_s.split('_').each {|s| s.capitalize!}.join('-')
      end

    end
  end
end

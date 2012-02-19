require 'httparty'

module Dialogue
  module Toolkit
    class Sms
      include HTTParty

      base_uri 'http://sendmsg.dialogue.net'
      headers  "Content-Type" => "application/json; charset=UTF-8"
      
      def initialize(u, p)
        @auth = {:username => u, :password => p}

      end
      
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
      
      # Keys passed as symbols and converted to associated X-E3- params.
      # e.g :validty_period becomes X-E3-Validity-Period
      def sym_to_param(s)
        'X-E3-' + s.to_s.split('_').each {|s| s.capitalize!}.join('-')
      end

    end
  end
end

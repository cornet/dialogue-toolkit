module Dialogue
  module Toolkit
    class Sms
      include HTTParty

      base_url = 'https://sendmsg.dialogue.net'
      headers  "Content-Type" => "application/json"
      
      def initialize(user, pass)
        basic_auth 'cwL3tO5mkv', 'oxqSVvd6'
      end
      
      def send(p)
        self.class.post('/submit_sm', :query => {'X-E3-Recipients' => p[:to], 'X-E3-Message' => p[:message]})
      end

    end
  end
end

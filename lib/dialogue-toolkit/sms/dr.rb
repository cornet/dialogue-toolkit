module Dialogue
  module Toolkit
    class Sms
      class Dr

        # Public: Returns the String E3 ID of the message if successful.
        attr_reader :id
        # Public: Returns the String of the recipients
        attr_reader :recipients
        # Public: Returns the String of the recipient network
        attr_reader :network
        # Public: Returns the user key set on submission
        attr_reader :user_key
        # Public: Returns the DateTime of the delivery
        attr_reader :timestamp
        # Public: Returns the string of the delivery status
        #         "00" is succesful, anything is failed
        attr_reader :delivery_report

        # Public: Initialize the Dr
        #
        # Retrun: True if successful, False if not
        def initialize(json)
          resp = JSON.parse(json)
          resp.each do |k,v|
            case k
            when 'X-E3-ID'
              @id = v
            when 'X-E3-Recipients'
              @recipients = v
            when 'X-E3-Network'
              @network = v
            when 'X-E3-User-Key'
              @user_key = v
            when 'X-E3-Timestamp'
              @timestamp = DateTime.parse(v)
            when 'X-E3-Delivery-Report'
              @delivery_report = v
            end
          end

          if @delivery_report.eql? '00'
            return true
          else
            return false
          end

        end
      end
    end
  end
end



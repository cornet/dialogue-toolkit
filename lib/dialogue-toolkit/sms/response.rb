module Dialogue
  module Toolkit
    class Sms
      class Response

        # Public: Returns the String E3 ID of the message if successful.
        attr_reader :id
        # Public: Returns the String of the recipients
        attr_reader :recipients
        # Public: Returns the String containing the submission report
        #         '00' is successful. Anything else is failure.
        #         See the Dialogue SMS Toolkit API guide for details.
        attr_reader :submission_report
        # Public: Returns the String of the error if there was one.
        attr_reader :error_description

        # Public: Initialize the response
        #
        # Retrun: True if successful, False if not
        def initialize(resp)
          resp.each do |k,v|
            case k
            when 'X-E3-ID'
              @id = v
            when 'X-E3-Recipients'
              @recipients = v
            when 'X-E3-Submission-Report'
              @submission_report = v
            when 'X-E3-Error-Description'
              @error_description = v
            end
          end

          if @submission_reporti.eql? '00'
            return true
          else
            return false
          end

        end
      end
    end
  end
end



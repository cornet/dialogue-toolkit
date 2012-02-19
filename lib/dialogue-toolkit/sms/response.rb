module Dialogue
  module Toolkit
    class Sms
      class Response

        attr_reader :id
        attr_reader :recipients
        attr_reader :submission_report
        attr_reader :error_description

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



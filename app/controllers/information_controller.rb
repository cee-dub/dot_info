class InformationController < ApplicationController
  def index
    render :index
  end
  
  def last_fm
    xml = Rails.cache.fetch('last_fm', :expires_in => 15.minutes) do
      begin
        curb = Curl::Easy.new do |c|
          c.follow_location = true
          c.encoding = 'deflate, gzip'
        end
        curb.url = ExternalApis.last_fm_url
        curb.perform
        curb.body_str
      rescue Curl::Err::CurlError => e
        Rails.logger.debug("Exception: #{e.inspect}\n#{e.backtrace.join("\n")}")
        ''
      end
    end
    render :xml => xml
  end
  
end

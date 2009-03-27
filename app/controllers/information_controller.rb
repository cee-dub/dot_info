class InformationController < ApplicationController
  def index
    render :index
  end
  
  def last_fm
    begin
      render :xml => ExternalApis.last_fm_url
    rescue Exception => e
      Rails.logger.debug("Exception: #{e.inspect}\n#{e.backtrace.join("\n")}")
      render :xml => ''
    end
  end
  
end

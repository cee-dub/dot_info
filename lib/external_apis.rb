module ExternalApis
  @config = YAML.load(File.read("config/external_apis.yml"))
  
  def google_ajax_url
    @config[:google_ajax][:url]
  end
  
  def last_fm_url
    @config[:last_fm][:url]
  end
  
  def google_analytics_id
    @config[:google_analytics][:id]
  end
  
  def google_webmaster_tools_meta
    @config[:google_webmaster_tools_meta]
  end
  
  extend self # make methods callable on module
end
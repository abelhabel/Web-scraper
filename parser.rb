require 'nokogiri'
require 'open-uri'
class Parser

  def search(selector)
    return 'No doc!' if !@doc
    @doc.css(selector)
  end

  def parse_local(path)
    @doc = Nokogiri::HTML(File.open(path))
  end

  def parse_url(url)
    @doc = Nokogiri::HTML(open(url))
  end

end
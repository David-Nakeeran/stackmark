class MetadataFetcherService
  def self.call(url)
    new(url).call
  end

  def initialize(url)
    @url = url
  end

  def call
    page = MetaInspector.new(@url)
    { title: page.title, description: page.description }
  end
end

class MarkdownService
  def initialize
    @processor = Qiita::Markdown::Processor.new(hostname: "example.com")
  end

  def exec(markdown)
    @processor.call(markdown)[:output].to_s.html_safe
  end
end

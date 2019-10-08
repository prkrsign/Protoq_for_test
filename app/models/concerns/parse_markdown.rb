module ParseMarkdown
  include BreakLine
  def parse_markdown
    markdown = MarkdownService.new.exec(content)
    markdown_with_empty_line = br(markdown)
    self.rendered_content = markdown_with_empty_line
  end
end

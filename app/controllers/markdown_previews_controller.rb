class MarkdownPreviewsController < ApplicationController
  include BreakLine

  def create
    markdown = MarkdownService.new().exec(params[:markdown])
    markdown_with_empty_line = br(markdown)
    render html: markdown_with_empty_line
  end
end

module BreakLine
  def br(str)
    str.gsub(/(^\n)/,"<br />").html_safe
  end
end

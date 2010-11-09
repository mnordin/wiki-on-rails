module ApplicationHelper
  
  #text.sub(regexp, '<a href="\1">\1</a>')
  
  def translate(body)
    body.gsub!("\[section\]", "<p>")
    body.gsub!("\[/section\]", "</p>")
    body.gsub!("\[b\]", "<strong>")
    body.gsub!("\[/b\]", "</strong>")
    body.gsub!("\[i\]", "<em>")
    body.gsub!("\[/i\]", "</em>")
    #body.gsub!("\n", "<br/>")
    #body.gsub!("\*", "!")
    
    body.gsub!(Regexp.new("===(.+)==="), "<h2>\1</h2>")
    body.gsub!(Regexp.new("==(.+)=="), "<h3>\1</h3>")
    body.gsub!(Regexp.new("\n\-\b(.+)", "<li>\1</li>"))
    body.gsub!(Regexp.new("\[\[(\w+)\]\]"), "<a href=\"/mongoose-wiki/article/view/\1\">\1</a>")
    body
  end

end

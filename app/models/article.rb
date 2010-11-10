class Article < ActiveRecord::Base
  
  #thx team viper
  def to_param
    "#{title.parameterize}"
  end
  
  
  # Check if this article is the same as the parameter article
  def equals? (article)
    return (self.title == article.title)
  end
  
  #@param query, finds articles by matching title first and then body (title
  # results come first in resulting array)
  #@return a result array containing article objects
  def search(query)
    
    results = Array.new
     
    query = Regexp.compile(query, true)
    
    Article.all.each do |article|
      if query.match(article.title) then
        results << article
      end
    end
    
    Article.all.each do |article|
      
      alreadyInResult = false
      
      results.each do |result|
        if result.equals? article then
          alreadyInResult = true
        end
      end
      
      if query.match(article.body) and not alreadyInResult then
        results << article
      end
      
    end
    
    return results
    
  end
   
end

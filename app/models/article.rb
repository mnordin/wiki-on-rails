class Article < ActiveRecord::Base
  
  #thx team viper
  def to_param
    "#{title.parameterize}"
  end
  
end

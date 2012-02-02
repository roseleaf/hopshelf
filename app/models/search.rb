class Search < ActiveRecord::Base


  def self.model_search(model, keywords, var = {})
    @search_options = { :page => var[:page] || 1,
                          :per_page => 15 }

    @search_options.merge!( :order => "@relevance DESC",
                            :sort_mode => :expr,
                            :sort_by => "@weight * @weight")

    model.constantize.search(keywords, @search_options)
  end
end
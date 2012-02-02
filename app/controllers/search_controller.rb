# class SearchController < ApplicationController

#     def search
#       @books = Book.search(params[:search])
#     # end

#     # def result
#     #   @books = Book.search(params[:search])
#       if !params[:search].blank?
#         @model = params[:search]
#       else
#         @model = "ThinkingSphinx"
#       end
#       @query = params[:search][:query]
      
#       @results = Search.model_search(@model, @query)
#     end

#     def index
#       @books = Book.search(params[:search])
#     # end

#     # def result
#     #   @books = Book.search(params[:search])
#       if !params[:search].blank?
#         @model = params[:search]
#       else
#         @model = "ThinkingSphinx"
#       end
#       @query = params[:search][:query]
      
#       @results = Search.model_search(@model, @query)
#     end

# end

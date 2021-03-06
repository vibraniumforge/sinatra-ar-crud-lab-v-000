require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article=Article.new({title: params[:title], content: params[:content]})
    article.save
    redirect "/articles/#{article.id}"
  end

  get '/articles' do
    @articles=Article.all
    erb :index
  end

  get '/articles/:id' do
    # binding.pry
    @article=Article.find(params[:id].to_i)
    erb :show
  end

  get '/articles/:id/edit' do
    @article=Article.find(params[:id].to_i)
    erb :edit
  end

  patch '/articles/:id' do
    @article=Article.find(params[:id].to_i)
    @article.update(title: params[:title])
    @article.update(content: params[:content])
    @article.save
    redirect 'articles/'+article.id.to_s
  end

  delete '/articles/:id/delete' do
    article=Article.find(params[:id].to_i)
    @title=article.title
    article.destroy
    erb :delete
  end

end

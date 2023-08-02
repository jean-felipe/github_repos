class HomeController < ApplicationController
  def index
    if params[:query]
      @repositories = GithubServices.get_repositories_by_username(params[:query])
    end
  end
end

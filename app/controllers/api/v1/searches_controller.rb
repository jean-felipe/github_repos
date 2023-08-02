module Api::V1
  class SearchesController < ActionController::API
    def search_repository_by_user
      repositories = GithubServices.get_repositories_by_username(params[:username])

      if repositories.is_a? Array
        SaveRepositoryJob.perform_async(repositories.to_json)
      end

      render json: repositories
    end

    def save_repository
      new_repo = UserRepository.new(repository_params)

      if new_repo.save
        render json: new_repo, status: 201
      else
        render json: new_repo.errors.messages, status: 422
      end
    end

    private

    def repository_params
      params.require(:repository).permit(
        :name, :stars, :github_id
      )
    end
  end
end

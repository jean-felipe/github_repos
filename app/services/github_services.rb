class GithubServices
  class << self
    def get_repositories_by_username(username)
      url = "https://api.github.com/users/#{username}/repos"

      response = HTTParty.get(url)

      repositories = JSON.parse(response.body)

      if response.code == 404
        "No repository found"
      else
        repositories.map do |repo|
          {
            github_id: repo['id'],
            name: repo['name'],
            stars: repo['stargazers_count']
          }
        end
      end
    end
  end
end

class SaveRepositoryJob
  include Sidekiq::Job

  def perform(repositories)
    JSON.parse(repositories).each do |repo|
      UserRepository.create(repo)
    end
  end
end

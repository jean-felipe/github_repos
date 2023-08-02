require 'rails_helper'

RSpec.describe GithubServices do
  describe '#get_repositories_by_username' do
    context 'when search by username' do
      it 'brings array of repos of the given username' do
        VCR.use_cassette('search_by_username_success') do
          response = described_class.get_repositories_by_username('schacon')

          expect(response.first[:github_id]).to eq(18652806)
          expect(response.first[:name]).to eq("3D-Me")
          expect(response.first[:stars]).to eq(0)
        end
      end
    end

    context 'when no rpeo found' do
      it 'respond back with error message' do
        VCR.use_cassette('no_repo_found') do
          response = described_class.get_repositories_by_username('schacon8899')

          expect(response).to eq("No repository found")
        end
      end
    end
  end
end

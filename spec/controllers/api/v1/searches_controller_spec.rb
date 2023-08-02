require 'rails_helper'

RSpec.describe Api::V1::SearchesController do
  describe '#search_repository_by_user' do
    context 'when serach finds repositories by given username' do
      it 'respond back with repositories found' do
        VCR.use_cassette('search_by_username_success') do
          get :search_repository_by_user, params: { username: 'schacon' }

          expect(json_body.first[:github_id]).to eq(18652806)
          expect(json_body.first[:name]).to eq("3D-Me")
          expect(json_body.first[:stars]).to eq(0)
        end
      end
    end

    context 'when seach does not find repositories' do
      it 'respond back with empty array' do
        VCR.use_cassette('search_by_username_fail') do
          get :search_repository_by_user, params: { username: 'schacon55666' }

          expect(response.body).to eq("No repository found")

        end
      end
    end
  end

  describe '#save_repository' do
    context 'when saving a repo' do
      let(:params) do
        {
          repository: {
            name: "3D-Me",
            stars: 10,
            github_id: 123456
          }
        }
      end

      it 'saves in the database the new repo' do
        expect { post :save_repository, params: params}.to change { UserRepository.count }.by(1)
      end
    end
  end
end

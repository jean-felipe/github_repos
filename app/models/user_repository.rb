# == Schema Information
#
# Table name: user_repositories
#
#  id          :bigint           not null, primary key
#  description :string
#  full_name   :string
#  name        :string
#  stars       :integer
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  github_id   :bigint
#  node_id     :string
#
class UserRepository < ApplicationRecord
  validates :github_id, uniqueness: true
end

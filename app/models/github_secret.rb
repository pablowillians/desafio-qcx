class GithubSecret < ApplicationRecord
  validates :secret, presence: true
end

module GithubSecrets
  class Repository
    def self.create_github_secret
      GithubSecret.create(secret: SecureRandom.uuid)
    end

    def self.get_github_secret
      GithubSecret.first
    end
  end
end

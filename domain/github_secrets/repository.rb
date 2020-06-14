module GithubSecrets
  class Repository
    def self.create_secret
      GithubSecret.create(secret: SecureRandom.uuid)
    end

    def self.get_secret
      GithubSecret.first
    end
  end
end

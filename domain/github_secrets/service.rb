module GithubSecrets
  class Service
    def self.verify_signature(payload_body, github_signature)
      github_secret = GithubSecrets::Repository.get_github_secret
      signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), github_secret.secret, payload_body)
      Rack::Utils.secure_compare(signature, github_signature)
    end
  end
end

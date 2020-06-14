task :github_secret => :environment do
  github_secret = GithubSecrets::Repository.get_secret

  unless github_secret
    github_secret = GithubSecrets::Repository.create_secret
  end

  puts "\n\nHere is your secret hash for GitHub: \e[32m" + github_secret.secret + "\e[0m\n\n"
end

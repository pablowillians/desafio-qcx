require 'rails_helper'

RSpec.describe GithubSecrets::Repository, type: :model do
  describe "#self.create_secret" do
    context "when all parameters is filled" do
      it "creates an issue_event in database" do
        created_secret = GithubSecrets::Repository.create_secret

        expect(GithubSecret.count).to eq 1 
        expect(GithubSecret.first.secret).to eq created_secret.secret
      end
    end
  end

  describe "#self.get_secret" do
    context "when there's no secret registered" do
      it "returns nil" do
        secret = GithubSecrets::Repository.get_secret
        expect(secret).to eq nil
      end
    end

    context "when secret is registered" do
      it "returns a GithubSecret entity" do
        created_secret = GithubSecrets::Repository.create_secret
        got_secret = GithubSecrets::Repository.get_secret

        expect(created_secret).to eq got_secret
      end
    end
  end
end

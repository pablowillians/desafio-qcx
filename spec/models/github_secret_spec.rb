require 'rails_helper'

RSpec.describe GithubSecret, type: :model do
  context "validations" do
    it { should validate_presence_of(:secret) }
  end
end

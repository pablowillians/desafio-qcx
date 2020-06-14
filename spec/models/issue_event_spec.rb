require 'rails_helper'

RSpec.describe IssueEvent, type: :model do
  context "validations" do
    it { should validate_presence_of(:issue_number) }
    it { should validate_numericality_of(:issue_number) }
  end
end

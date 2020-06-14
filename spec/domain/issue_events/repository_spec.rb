require 'rails_helper'

RSpec.describe IssueEvents::Repository, type: :model do
  describe "#self.create" do
    context "when all parameters is filled" do
      before do
        @valid_attrs = {
          issue_number: Faker::Number.number,
          event_payload: "{payload: {key: value}}"
        }
      end

      it "creates an issue_event in database" do
        IssueEvents::Repository.create(@valid_attrs[:issue_number], @valid_attrs[:event_payload])

        issue_events = IssueEvents::Repository.list_by_issue_number(@valid_attrs[:issue_number])

        expect(issue_events.count).to eq 1
        expect(IssueEvent.count).to eq 1
      end
    end

    context "when payload parameter is nil" do
      it "creates an issue_event in database" do
        issue_number = Faker::Number.number
        IssueEvents::Repository.create(issue_number, nil)

        issue_events = IssueEvents::Repository.list_by_issue_number(issue_number)

        expect(issue_events.count).to eq 1
        expect(IssueEvent.count).to eq 1
        expect(issue_events.first.issue_number).to eq issue_number
        expect(issue_events.first.event_payload).to eq nil
      end
    end

    context "with invalid issue_number" do
      before do
        @invalid_attrs = {
          issue_number: Faker::Alphanumeric.alphanumeric,
          event_payload: "{payload: {key: value}}"
        }
      end

      it "returns a validation error on issue_number" do
        create_return = IssueEvents::Repository.create(
          @invalid_attrs[:issue_number],
          @invalid_attrs[:event_payload]
        )

        expect(create_return).to have(1).error_on(:issue_number)
      end
    end
  end

  describe "#self.list_by_issue_number" do
    context "when issue_number doesn't exists" do
      it "returns nil" do
        issue_events = IssueEvents::Repository.list_by_issue_number(Faker::Number.number)
        expect(issue_events).to be_empty
      end
    end

    context "when issue_number exists" do
      it "returns a list of issue_events by with this issue_number" do
        issue_number = Faker::Number.number
        2.times { IssueEvents::Repository.create(issue_number, "") }

        issue_events = IssueEvents::Repository.list_by_issue_number(issue_number)

        expect(issue_events.count).to eq 2
      end
    end
  end
end

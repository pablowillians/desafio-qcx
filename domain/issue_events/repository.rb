module IssueEvents
  class Repository
    def self.create(issue_number, event_payload)
      issue_event = IssueEvent.new
      issue_event.issue_number = issue_number
      issue_event.event_payload = event_payload
      issue_event.save
    end

    def self.list_by_issue_number(issue_number)
      IssueEvent.where(issue_number: issue_number).order(created_at: :asc)
    end
  end
end

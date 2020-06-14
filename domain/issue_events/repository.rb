module IssueEvents
  class Repository
    def self.create(issue_number, event_payload)
      IssueEvent.create(issue_number: issue_number, event_payload: event_payload)
    end

    def self.list_by_issue_number(issue_number)
      IssueEvent.where(issue_number: issue_number).order(created_at: :asc)
    end
  end
end

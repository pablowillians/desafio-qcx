class CreateIssueEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :issue_events, id: :uuid do |t|
      t.integer :issue_number, limit: 8
      t.text :event_payload

      t.timestamps
    end
  end
end

class IssueEventsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: IssueEvents::Repository.list_by_issue_number(params[:issue_number])
  end
end

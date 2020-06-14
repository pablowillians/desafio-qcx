class WebhookController < ApplicationController
  protect_from_forgery except: :index

  def index
    request.body.rewind
    payload_body = request.body.read

    is_signature_valid = GithubSecrets::Service.verify_signature(payload_body, request.env['HTTP_X_HUB_SIGNATURE'])

    unless is_signature_valid
      return halt 500, "Signatures didn't match!"
    end

    issue_number = params[:issue][:number]
    issue_event = IssueEvents::Repository.create(issue_number, params)

    render json: issue_event, status: :created
  end
end

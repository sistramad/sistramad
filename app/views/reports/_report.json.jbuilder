json.extract! report, :id, :user, :document, :jointplan, :applicant_id, :created_at, :updated_at
json.url report_url(report, format: :json)
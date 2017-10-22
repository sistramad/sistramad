json.extract! review, :id, :name, :comment, :files_reviewed, :approval, :step_id, :created_at, :updated_at
json.url review_url(review, format: :json)
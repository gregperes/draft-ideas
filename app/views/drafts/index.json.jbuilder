json.array!(@drafts) do |draft|
  json.extract! draft, :title, :description, :tags, :user_id, :archived
  json.url draft_url(draft, format: :json)
end

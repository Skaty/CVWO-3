json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :completed, :user_id, :category_id
  json.url task_url(task, format: :json)
end

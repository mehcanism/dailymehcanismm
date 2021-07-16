json.extract! category_task, :id, :name, :description, :status, :category_id, :created_at, :updated_at
json.url category_task_url(category_task, format: :json)

json.extract! client, :id, :name, :contact_no, :email_address, :project_name, :identity_document, :identity_number, :Employee_id, :created_at, :updated_at
json.url client_url(client, format: :json)
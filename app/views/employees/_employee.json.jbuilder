json.extract! employee, :id, :emp_id, :name, :contact_no, :email_address, :identity_document, :identity_number, :created_at, :updated_at
json.url employee_url(employee, format: :json)
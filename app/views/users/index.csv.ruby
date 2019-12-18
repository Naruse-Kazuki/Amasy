require 'csv'

CSV.generate do |csv|
  column_names = %w(name email department employee_number uid basic_time designated_work_start_time designated_work_end_time superior admin password )
  csv << column_names
  @user.each do |user|
    column_values = [
      user.name,
      user.email,
      user.department,
      user.employee_number,
      user.uid,
      user.basic_time,
      user.designated_work_start_time,
      user.designated_work_end_time,
      user.superior,
      user.admin,
      user.password
    ]
    csv << column_values
  end
end
require 'csv'

CSV.generate do |csv|
  column_names = %w(worked_on started_at finished_at)
  csv << column_names
  
    @attendances.each do |at|
      column_values = [
        at.worked_on,
        at.started_at,
        at.finished_at,
      ]
      csv << column_values
    end
  
end
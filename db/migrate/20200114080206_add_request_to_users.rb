class AddRequestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :request, :string
  end
end

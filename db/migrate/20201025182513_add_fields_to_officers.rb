class AddFieldsToOfficers < ActiveRecord::Migration[6.0]
  def change
    add_column :officers, :race, :string
    add_column :officers, :job_title, :string
    add_column :officers, :gender, :string
    add_column :officers, :badge_number, :integer
  end
end

class RemoveDescriptionFromOfficers < ActiveRecord::Migration[6.0]
  def change
    remove_column :officers, :description, :string
  end
end

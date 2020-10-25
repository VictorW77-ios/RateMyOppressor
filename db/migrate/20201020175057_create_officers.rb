class CreateOfficers < ActiveRecord::Migration[6.0]
  def change
    create_table :officers do |t|
      t.string :name
      t.string :description
      # t.string :race
      # t.string :job_title
      # t.string :gender 
      # t.integer :badge_number

      t.timestamps
    end

    # change_table :officers do |t|
    #   t.remove :description
    #   t.string :race
    #   t.string :job_title 
    #   t.string :gender
    #   t.index :badge_number
    # end
  end
end

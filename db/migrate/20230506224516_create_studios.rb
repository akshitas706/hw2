class CreateStudios < ActiveRecord::Migration[7.0]
  def change
    create_table :studios do |t|
t.string "Name"
      t.timestamps
    end
  end
end

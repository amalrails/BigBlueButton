class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :meeting_id
      t.string :meeting_name
      t.text :description

      t.timestamps
    end
  end
end

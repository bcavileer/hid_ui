class CreateHidUiRecords < ActiveRecord::Migration
  def change
    create_table :hid_ui_records do |t|
      t.string :input, :null => false
      t.string :id_type

      t.timestamps
    end
    add_index :hid_ui_records, :id_type
  end
end

class CreateHidUiIdentities < ActiveRecord::Migration
  def change
    create_table :hid_ui_identities do |t|
      t.string :input, :null => false
      t.string :identity, :null => false
      t.string :id_type

      t.timestamps
    end
    add_index :hid_ui_identities, :id_type
  end
end

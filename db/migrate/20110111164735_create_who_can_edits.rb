class CreateWhoCanEdits < ActiveRecord::Migration
  def self.up
    create_table :who_can_edits do |t|
      t.text :description
			t.string :name
			t.integer :order_index

      t.timestamps
    end
  end

  def self.down
    drop_table :who_can_edits
  end
end

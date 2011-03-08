class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
			t.text :brief_description
			t.text :full_description
			t.string :name
			t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :licenses
  end
end

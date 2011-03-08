class CreateArticles < ActiveRecord::Migration
  def self.up
		create_table :articles do |t|
			t.integer :category_id
			t.integer :license_id
			t.integer :screenshot_id
			t.integer :sub_category_id
			t.integer :user_id
      t.integer :who_can_edit_id
      t.boolean :agree, :default => 0
      t.text :content
			t.string :description
			t.string :title
      
			t.timestamps
		end

    add_index :articles, :category_id
		add_index :articles, :license_id
		add_index :articles, :screenshot_id
		add_index :articles, :sub_category_id
		add_index :articles, :user_id
		add_index :articles, :who_can_edit_id
  end

  def self.down
		drop_table :articles
  end
end

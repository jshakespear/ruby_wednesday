class CreateLearningZones < ActiveRecord::Migration
  def self.up
    create_table :learning_zones do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :learning_zones
  end
end

class CreateSocializePlans < ActiveRecord::Migration
  def self.up
    create_table :socialize_plans do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end

  def self.down
    drop_table :socialize_plans
  end
end

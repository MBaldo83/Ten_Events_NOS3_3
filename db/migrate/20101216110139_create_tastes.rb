class CreateTastes < ActiveRecord::Migration
  def self.up
    create_table :tastes do |t|
	t.string :genre

      t.timestamps
    end
  end

  def self.down
    drop_table :tastes
  end
end

class AddPicToDishes < ActiveRecord::Migration
  def self.up
    add_attachment :dishes, :pic
  end

  def self.down
    remove_attachment :dishes, :pic
  end
end

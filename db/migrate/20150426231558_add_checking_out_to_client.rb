class AddCheckingOutToClient < ActiveRecord::Migration
  def change
    add_column :clients, :checking_out, :boolean
  end
end

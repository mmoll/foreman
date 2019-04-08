class AddNicDelayToSubnet < ActiveRecord::Migration[4.2]
  def change
    add_column :subnets, :nic_delay, :integer, :default => 0, :null => false, :limit => 4
  end
end

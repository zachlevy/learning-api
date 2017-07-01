class AddFlowToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :flow, :jsonb, null: false, default: []
  end
end

class AddPictureToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :picture, :string
  end
end

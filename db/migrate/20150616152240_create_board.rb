class CreateBoard < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
    end
  end
end

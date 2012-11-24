class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :link

      t.timestamps
    end
  end
end

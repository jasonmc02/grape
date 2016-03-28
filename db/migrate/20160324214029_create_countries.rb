class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|

      t.string :name
      t.string :description
      t.string :meta
      t.boolean :allowed

      t.timestamps null: false
    end
  end
end

class ApplicationConfiguration < ActiveRecord::Migration[5.1]
  def change
    create_table :application_configurations do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.timestamps
    end
  end
end

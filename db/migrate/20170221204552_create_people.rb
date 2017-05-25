class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name

      t.timestamps
      t.belongs_to :passport, index: true
    end
  end
end

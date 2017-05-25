class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps

      t.belongs_to :author, index: true
    end
  end
end

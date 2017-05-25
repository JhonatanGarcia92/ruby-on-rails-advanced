class CreatePassports < ActiveRecord::Migration[5.0]
  def change
    create_table :passports do |t|
      t.string :country

      t.timestamps
    end
  end
end

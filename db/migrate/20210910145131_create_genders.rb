class CreateGenders < ActiveRecord::Migration[6.0]
  def change
    create_table :genders do |t|
      t.string :name
      t.references :film, null: false, foreign_key: true

      t.timestamps
    end
  end
end

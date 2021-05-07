class CreateNominees < ActiveRecord::Migration[6.1]
  def change
    create_table :nominees do |t|
      t.references :user, null: false, foreign_key: true
      t.string :imdbID

      t.timestamps
    end
  end
end

class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word
      t.bigint :appearance

      t.timestamps
    end

    add_index :words, :word, unique: true
  end
end

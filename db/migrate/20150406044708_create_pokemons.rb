class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :string
      t.integer :level
      t.integer :trainer_id
      t.integer :health

      t.timestamps
    end
  end
end

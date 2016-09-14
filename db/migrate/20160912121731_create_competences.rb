class CreateCompetences < ActiveRecord::Migration[5.0]
  def change
    create_table :competences do |t|
      t.string :name

      t.timestamps
    end
  end
end

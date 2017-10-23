
class CreateUniversityDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :university_degrees do |t|
      t.string :name, null: false
      t.references :university, index: true, foreign_key: true, null: false
      t.integer :academic_degree_id, null: false

      t.timestamps null: false
    end
  end
end

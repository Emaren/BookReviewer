class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :is_up
      t.references :review, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

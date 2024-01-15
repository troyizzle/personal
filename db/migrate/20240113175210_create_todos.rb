class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.datetime :completed_at, null: true
      t.date :due_date, null: true
      t.boolean :done

      t.timestamps
    end
  end
end

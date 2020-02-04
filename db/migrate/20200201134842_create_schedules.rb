class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :business, foreign_key: true
      t.integer :status, default: 2
      t.datetime :first_date
      t.datetime :last_date
      t.boolean :all_day, default: true
      t.boolean :deadline, default: false
      t.datetime :deadline_date
      t.boolean :deadline_all_day, default: true
      t.boolean :selection, default: false
      t.datetime :selection_date
      t.boolean :selection_all_day, default: true

      t.timestamps
    end
    add_index :schedules, [:user_id, :first_date, :last_date]
    add_index :schedules, [:user_id, :status, :deadline_date]
    add_index :schedules, [:user_id, :status, :selection_date]
  end
end

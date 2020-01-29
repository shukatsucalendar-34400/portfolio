class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :abbreviated_name
      t.string :web_site
      t.string :my_page
      t.string :address
      t.text :details
      t.text :memo

      t.timestamps
    end
  end
end

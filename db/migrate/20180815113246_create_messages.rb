class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :description

      t.timestamps null: false ###null: false
    end
  end
end

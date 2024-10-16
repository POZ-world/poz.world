# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[7.1]
  def up
    create_table :links do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :group, null: false
      t.integer :position, null: false

      t.timestamps
      t.datetime :deleted_at, null: true
    end
  end

  def down
    drop_table :links
  end
end

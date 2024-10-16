# frozen_string_literal: true

# db/migrate/xxxxxx_create_field_values.rb
class CreateFaqs < ActiveRecord::Migration[7.1]
  def up
    create_table :faqs do |t|
      t.integer :number, null: false
      t.text :question, null: false
      t.text :answer, null: false

      t.timestamps
      t.datetime :deleted_at, null: true
    end

    add_index :faqs, :number, unique: true
  end

  def down
    drop_table :faqs
  end
end

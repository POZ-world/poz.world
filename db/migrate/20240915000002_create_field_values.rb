# frozen_string_literal: true

# db/migrate/xxxxxx_create_field_values.rb
class CreateFieldValues < ActiveRecord::Migration[7.1]
  def up
    create_table :field_values do |t|
      t.references :field_template, null: false, foreign_key: true

      t.boolean :default, default: false
      t.integer :order, default: 0

      t.text :value, null: true

      t.text :description, null: true
      t.text :first_person_singular_description, null: true
      t.text :second_person_singular_description, null: true
      t.text :third_person_masculine_description, null: true

      t.text :display_value, null: false
      t.text :first_person_singular_display_value, null: false
      t.text :second_person_singular_display_value, null: false
      t.text :third_person_masculine_display_value, null: false

      t.timestamps
      t.datetime :deleted_at, null: true
    end
  end

  def down
    drop_table :field_values
  end
end

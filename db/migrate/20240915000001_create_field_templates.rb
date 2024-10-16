# frozen_string_literal: true

# db/migrate/xxxxxx_create_field_templates.rb
class CreateFieldTemplates < ActiveRecord::Migration[7.1]
  def up
    create_table :field_templates do |t|
      t.text :name, null: false
      t.text :field_type, null: false, default: :string
      t.text :category, null: true
      t.boolean :dropdown, default: false, null: false
      t.boolean :multiple, default: false, null: false
      t.text :description, null: true
      t.text :first_person_singular_description, null: true
      t.text :second_person_singular_description, null: true
      t.text :third_person_masculine_description, null: true
      t.jsonb :rules, null: false, default: {}

      t.timestamps
      t.datetime :deleted_at, null: true
    end
  end

  def down
    drop_table :field_templates
  end
end

class CreateJuridicalReports < ActiveRecord::Migration
  def change
    create_table :juridical_reports do |t|

      t.string  :name 
      t.text    :description
      t.date    :date
      t.string  :code
      t.integer :situation, default: 0
      t.boolean :publish, default: false
      t.boolean :special, default: false
      t.string  :file_path

      t.timestamps null: false
    end
  end
end

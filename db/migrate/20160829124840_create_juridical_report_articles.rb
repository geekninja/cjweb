class CreateJuridicalReportArticles < ActiveRecord::Migration
  def change
    create_table :juridical_report_articles do |t|
      t.integer :juridical_report_id, index: true
      t.integer :article_id, index: true

      t.timestamps null: false
    end
  end
end

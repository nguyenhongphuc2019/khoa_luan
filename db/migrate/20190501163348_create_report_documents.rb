class CreateReportDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :report_documents do |t|
      t.references :document, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

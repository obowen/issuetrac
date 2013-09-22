class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :details
      t.string :reported_by
      t.string :assigned_to
      t.integer :status

      t.timestamps
    end
  end
end

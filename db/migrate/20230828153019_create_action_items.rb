class CreateActionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :action_items do |t|
      t.string :content
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end

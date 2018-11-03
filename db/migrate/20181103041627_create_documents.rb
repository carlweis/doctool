class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :user
      t.string :title, null: false, default: "", unique: true
      t.text :content, null: false, default: ""
      t.string :state, null: false, default: "draft"
      t.string :permalink, null: false, default: ""

      t.timestamps
    end

    add_index :documents, :title, unique: true
    add_index :documents, :permalink, unique: true
  end
end

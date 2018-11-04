class AddHeroImageToDocuments < ActiveRecord::Migration[5.2]
  def up
    add_column :documents, :hero_image, :text, null: false, default: ""
  end

  def down
    remove_column :documents, :hero_image
  end
end

class AddAttachmentsToDocuments < ActiveRecord::Migration[5.2]
  def up
    add_column :documents, :attachments, :json, null: false, default: '{}'
  end

  def down
    remove_column :documents, :attachments
  end
end

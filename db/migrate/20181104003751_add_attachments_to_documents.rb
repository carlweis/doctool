class AddAttachmentsToDocuments < ActiveRecord::Migration[5.2]
  def up
    add_column :documents, :attachments, :json
  end

  def down
    remove_column :documents, :attachments
  end
end

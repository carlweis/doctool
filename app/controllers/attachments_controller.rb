class AttachmentsController < ApplicationController
  def create
    @attachment = Attachment.new(attachment_params)
    if @attachment.save!
      render @attachment
    end
  end

  def show
    @attachment = Attachment.find_by(id: params[:id])
    if @attachment
      respond_to do |format|
        format.json
      end
    else
      render json: { error: "Attachment not found" }
    end
  end

  private

  def attachment_params
    params.require(:attachment).permit(
      :file
    )
  end
end

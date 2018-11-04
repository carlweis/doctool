class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @documents = current_user.documents.order(:title)
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.user = current_user
    @document.permalink = @document.title.parameterize

    if @document.save!
      flash[:success] = "New document #{@document.title} created!"

      respond_to do |format|
        format.html do
          redirect_to edit_document_path(@document)
        end
        format.json do
          render :show, status: :created, location: @document
        end
      end
    else
      render :new
    end
  end

  def show
    @document = current_user.documents.find_by_id_or_permalink(id: params[:id])

    if !@document
      flash[:error] = "Document #{params[:id]} not found."
      redirect_to documents_path
    end
  end

  def edit
    @document = current_user.documents.find_by(id: params[:id])

    if !@document
      flash[:error] = "Document #{params[:id]} not found."
      redirect_to documents_path
    end
  end

  def update
    @document = Document.find_by(id: params[:id])

    if @document.update(document_params)
      flash[:success] = "New document #{@document.title} saved!"
      respond_to do |format|
        format.html do
          redirect_to edit_document_path(@document)
        end
        format.json do
          render :show, status: :created, location: @document
        end
      end
    else
      render :edit
    end
  end

  private

  def document_params
    params.require(:document).permit(
      :title,
      :content,
      :attachments,
      { attachments: [] }
    )
  end
end

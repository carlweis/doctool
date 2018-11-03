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

    if @document.save
      flash[:success] = "New document #{@document.title} created!"
      redirect_to @document
    else
      render :new
    end
  end

  def show
    @document = Document.find_by_id_or_permalink(id: params[:id])

    if !@document
      flash[:error] = "Document #{params[:id]} not found."
      redirect_to documents_path
    end
  end

  def edit
    @document = Document.find_by(id: params[:id])

    if !@document
      flash[:error] = "Document #{params[:id]} not found."
      redirect_to documents_path
    end
  end

  def update
    @document = Document.find_by(id: params[:id])

    if @document.update(document_params)
      flash[:success] = "New document #{@document.title} saved!"
      redirect_to @document
    else
      render :edit
    end
  end

  private

  def document_params
    params.require(:document).permit(
      :title,
      :content,
    )
  end
end

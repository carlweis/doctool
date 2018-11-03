class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @document = Document.new
  end
end

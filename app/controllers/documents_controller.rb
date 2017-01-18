class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end

  def index
    @documents = Document.all
  end

end
class JointplanDocumentsController < ApplicationController

  def new
    @document = JointplanDocument.new
  end

  def index
    @documents = JointplanDocument.all
  end

end
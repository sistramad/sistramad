require 'rails_helper'

RSpec.describe "procedures/show", type: :view do
  before(:each) do
    @procedure = assign(:procedure, Procedure.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

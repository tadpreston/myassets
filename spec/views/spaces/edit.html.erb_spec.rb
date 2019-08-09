require 'rails_helper'

RSpec.describe "spaces/edit", type: :view do
  before(:each) do
    @space = assign(:space, Space.create!(
      :user_id => nil,
      :name => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit space form" do
    render

    assert_select "form[action=?][method=?]", space_path(@space), "post" do

      assert_select "input[name=?]", "space[user_id_id]"

      assert_select "textarea[name=?]", "space[name]"

      assert_select "textarea[name=?]", "space[description]"
    end
  end
end

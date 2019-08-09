require 'rails_helper'

RSpec.describe "spaces/new", type: :view do
  before(:each) do
    assign(:space, Space.new(
      :user_id => nil,
      :name => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new space form" do
    render

    assert_select "form[action=?][method=?]", spaces_path, "post" do

      assert_select "input[name=?]", "space[user_id_id]"

      assert_select "textarea[name=?]", "space[name]"

      assert_select "textarea[name=?]", "space[description]"
    end
  end
end

require 'rails_helper'

RSpec.describe "spaces/index", type: :view do
  before(:each) do
    assign(:spaces, [
      Space.create!(
        :user_id => nil,
        :name => "MyText",
        :description => "MyText"
      ),
      Space.create!(
        :user_id => nil,
        :name => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of spaces" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

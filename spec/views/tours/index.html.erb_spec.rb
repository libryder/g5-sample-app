require 'spec_helper'

describe "tours/index" do
  before(:each) do
    assign(:tours, [
      stub_model(Tour,
        :user_id => "User",
        :additional_questions => "Additional Questions",
        :rating => 1
      ),
      stub_model(Tour,
        :user_id => "User",
        :additional_questions => "Additional Questions",
        :rating => 1
      )
    ])
  end

  it "renders a list of tours" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Additional Questions".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

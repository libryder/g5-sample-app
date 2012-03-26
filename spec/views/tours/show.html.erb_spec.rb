require 'spec_helper'

describe "tours/show" do
  before(:each) do
    @tour = assign(:tour, stub_model(Tour,
      :user_id => "User",
      :additional_questions => "Additional Questions",
      :rating => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/Additional Questions/)
    rendered.should match(/1/)
  end
end

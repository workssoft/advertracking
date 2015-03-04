require 'rails_helper'

RSpec.describe "task_lists/index", :type => :view do
  before(:each) do
    assign(:task_lists, [
      TaskList.create!(
        :title => "Title",
        :description => "MyText"
      ),
      TaskList.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of task_lists" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

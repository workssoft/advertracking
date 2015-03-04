require 'rails_helper'

RSpec.describe "task_lists/new", :type => :view do
  before(:each) do
    assign(:task_list, TaskList.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new task_list form" do
    render

    assert_select "form[action=?][method=?]", task_lists_path, "post" do

      assert_select "input#task_list_title[name=?]", "task_list[title]"

      assert_select "textarea#task_list_description[name=?]", "task_list[description]"
    end
  end
end

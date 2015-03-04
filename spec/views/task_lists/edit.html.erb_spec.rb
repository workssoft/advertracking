require 'rails_helper'

RSpec.describe "task_lists/edit", :type => :view do
  before(:each) do
    @task_list = assign(:task_list, TaskList.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit task_list form" do
    render

    assert_select "form[action=?][method=?]", task_list_path(@task_list), "post" do

      assert_select "input#task_list_title[name=?]", "task_list[title]"

      assert_select "textarea#task_list_description[name=?]", "task_list[description]"
    end
  end
end

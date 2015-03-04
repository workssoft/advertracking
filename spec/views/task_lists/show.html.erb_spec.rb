require 'rails_helper'

RSpec.describe "task_lists/show", :type => :view do
  before(:each) do
    @task_list = assign(:task_list, TaskList.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end

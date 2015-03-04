require "rails_helper"

RSpec.describe TaskListsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/task_lists").to route_to("task_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/task_lists/new").to route_to("task_lists#new")
    end

    it "routes to #show" do
      expect(:get => "/task_lists/1").to route_to("task_lists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/task_lists/1/edit").to route_to("task_lists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/task_lists").to route_to("task_lists#create")
    end

    it "routes to #update" do
      expect(:put => "/task_lists/1").to route_to("task_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_lists/1").to route_to("task_lists#destroy", :id => "1")
    end

  end
end

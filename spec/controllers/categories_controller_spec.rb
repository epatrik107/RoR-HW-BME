require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #new" do
    it "assigns a new category" do
      get :new
      expect(assigns(:category)).not_to be_a_new(Category)
    end
  end
end


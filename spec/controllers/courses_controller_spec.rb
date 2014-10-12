require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do

  describe "GET _course_form.html.erb" do
    it "returns http success" do
      get :_course_form.html.erb
      expect(response).to be_success
    end
  end

end

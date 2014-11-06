require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe YearsController do

  # This should return the minimal set of attributes required to create a valid
  # Year. As you add validations to Year, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "year" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # YearsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all years as @years" do
      year = Year.create! valid_attributes
      get :index, {}, valid_session
      assigns(:years).should eq([year])
    end
  end

  describe "GET show" do
    it "assigns the requested year as @year" do
      year = Year.create! valid_attributes
      get :show, {:id => year.to_param}, valid_session
      assigns(:year).should eq(year)
    end
  end

  describe "GET new" do
    it "assigns a new year as @year" do
      get :new, {}, valid_session
      assigns(:year).should be_a_new(Year)
    end
  end

  describe "GET edit" do
    it "assigns the requested year as @year" do
      year = Year.create! valid_attributes
      get :edit, {:id => year.to_param}, valid_session
      assigns(:year).should eq(year)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Year" do
        expect {
          post :create, {:year => valid_attributes}, valid_session
        }.to change(Year, :count).by(1)
      end

      it "assigns a newly created year as @year" do
        post :create, {:year => valid_attributes}, valid_session
        assigns(:year).should be_a(Year)
        assigns(:year).should be_persisted
      end

      it "redirects to the created year" do
        post :create, {:year => valid_attributes}, valid_session
        response.should redirect_to(Year.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved year as @year" do
        # Trigger the behavior that occurs when invalid params are submitted
        Year.any_instance.stub(:save).and_return(false)
        post :create, {:year => { "year" => "invalid value" }}, valid_session
        assigns(:year).should be_a_new(Year)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Year.any_instance.stub(:save).and_return(false)
        post :create, {:year => { "year" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested year" do
        year = Year.create! valid_attributes
        # Assuming there are no other years in the database, this
        # specifies that the Year created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Year.any_instance.should_receive(:update).with({ "year" => "MyString" })
        put :update, {:id => year.to_param, :year => { "year" => "MyString" }}, valid_session
      end

      it "assigns the requested year as @year" do
        year = Year.create! valid_attributes
        put :update, {:id => year.to_param, :year => valid_attributes}, valid_session
        assigns(:year).should eq(year)
      end

      it "redirects to the year" do
        year = Year.create! valid_attributes
        put :update, {:id => year.to_param, :year => valid_attributes}, valid_session
        response.should redirect_to(year)
      end
    end

    describe "with invalid params" do
      it "assigns the year as @year" do
        year = Year.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Year.any_instance.stub(:save).and_return(false)
        put :update, {:id => year.to_param, :year => { "year" => "invalid value" }}, valid_session
        assigns(:year).should eq(year)
      end

      it "re-renders the 'edit' template" do
        year = Year.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Year.any_instance.stub(:save).and_return(false)
        put :update, {:id => year.to_param, :year => { "year" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested year" do
      year = Year.create! valid_attributes
      expect {
        delete :destroy, {:id => year.to_param}, valid_session
      }.to change(Year, :count).by(-1)
    end

    it "redirects to the years list" do
      year = Year.create! valid_attributes
      delete :destroy, {:id => year.to_param}, valid_session
      response.should redirect_to(years_url)
    end
  end

end

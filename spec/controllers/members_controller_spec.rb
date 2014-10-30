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

describe MembersController do

  # This should return the minimal set of attributes required to create a valid
  # Member. As you add validations to Member, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "identifier" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MembersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all members as @members" do
      member = Member.create! valid_attributes
      get :index, {}, valid_session
      assigns(:members).should eq([member])
    end
  end

  describe "GET show" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :show, {:id => member.to_param}, valid_session
      assigns(:member).should eq(member)
    end
  end

  describe "GET new" do
    it "assigns a new member as @member" do
      get :new, {}, valid_session
      assigns(:member).should be_a_new(Member)
    end
  end

  describe "GET edit" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :edit, {:id => member.to_param}, valid_session
      assigns(:member).should eq(member)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, {:member => valid_attributes}, valid_session
        }.to change(Member, :count).by(1)
      end

      it "assigns a newly created member as @member" do
        post :create, {:member => valid_attributes}, valid_session
        assigns(:member).should be_a(Member)
        assigns(:member).should be_persisted
      end

      it "redirects to the created member" do
        post :create, {:member => valid_attributes}, valid_session
        response.should redirect_to(Member.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved member as @member" do
        # Trigger the behavior that occurs when invalid params are submitted
        Member.any_instance.stub(:save).and_return(false)
        post :create, {:member => { "identifier" => "invalid value" }}, valid_session
        assigns(:member).should be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Member.any_instance.stub(:save).and_return(false)
        post :create, {:member => { "identifier" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested member" do
        member = Member.create! valid_attributes
        # Assuming there are no other members in the database, this
        # specifies that the Member created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Member.any_instance.should_receive(:update).with({ "identifier" => "MyString" })
        put :update, {:id => member.to_param, :member => { "identifier" => "MyString" }}, valid_session
      end

      it "assigns the requested member as @member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        assigns(:member).should eq(member)
      end

      it "redirects to the member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        response.should redirect_to(member)
      end
    end

    describe "with invalid params" do
      it "assigns the member as @member" do
        member = Member.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Member.any_instance.stub(:save).and_return(false)
        put :update, {:id => member.to_param, :member => { "identifier" => "invalid value" }}, valid_session
        assigns(:member).should eq(member)
      end

      it "re-renders the 'edit' template" do
        member = Member.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Member.any_instance.stub(:save).and_return(false)
        put :update, {:id => member.to_param, :member => { "identifier" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested member" do
      member = Member.create! valid_attributes
      expect {
        delete :destroy, {:id => member.to_param}, valid_session
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      member = Member.create! valid_attributes
      delete :destroy, {:id => member.to_param}, valid_session
      response.should redirect_to(members_url)
    end
  end

end

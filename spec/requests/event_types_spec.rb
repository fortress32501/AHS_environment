require 'rails_helper'
require 'support/spec_test_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/event_types", type: :request do
  include SpecTestHelper
  # This should return the minimal set of attributes required to create a valid
  # EventType. As you add validations to EventType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {type_name: 'test', description: 'test', color: '#FFFFFF'}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let!(:testuser) {
    {first_name: 'test', last_name: 'test', email: 'test@gmail.com', password: 'test'}
  }

  let!(:adminuser) {
    {first_name: 'test', last_name: 'test', email: 'test@gmail.com', password: 'test', is_admin: true}
  }

  describe "GET /index" do
    it "renders a successful response" do
      post users_url, params: {user: testuser}
      EventType.create! valid_attributes
      get event_types_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      post users_url, params: {user: testuser}
      event_type = EventType.create! valid_attributes
      get event_type_url(event_type)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      post users_url, params: {user: testuser}
      get new_event_type_url
      puts response.body
      expect(response).to redirect_to(event_types_path)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      post users_url, params: {user: testuser}
      event_type = EventType.create! valid_attributes
      get edit_event_type_url(event_type)
      expect(response).to redirect_to(event_types_path)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new EventType" do
        post users_url, params: {user: adminuser}
        expect {
          post event_types_url, params: { event_type: valid_attributes }
        }.to change(EventType, :count).by(1)
      end

      it "redirects to the created event_type" do
        post users_url, params: {user: adminuser}
        post event_types_url, params: { event_type: valid_attributes }
        expect(response).to redirect_to(event_type_url(EventType.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new EventType" do
        expect {
          post event_types_url, params: { event_type: invalid_attributes }
        }.to change(EventType, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post event_types_url, params: { event_type: invalid_attributes }
        #expect(response).to be_successful
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {:type_name => 'test1'}
      }

      it "updates the requested event_type" do
        post users_url, params: {user: adminuser}
        event_type = EventType.create! valid_attributes
        patch event_type_url(event_type), params: { event_type: new_attributes }
        event_type.reload
        expect(event_type.type_name).to eql new_attributes[:type_name]
      end

      it "redirects to the event_type" do
        post users_url, params: {user: adminuser}
        event_type = EventType.create! valid_attributes
        patch event_type_url(event_type), params: { event_type: new_attributes }
        event_type.reload
        expect(response).to redirect_to(event_type_url(event_type))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        event_type = EventType.create! valid_attributes
        patch event_type_url(event_type), params: { event_type: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested event_type" do
      post users_url, params: {user: adminuser}
      event_type = EventType.create! valid_attributes
      expect {
        delete event_type_url(event_type)
      }.to change(EventType, :count).by(-1)
    end

    it "redirects to the event_types list" do
      post users_url, params: {user: adminuser}
      event_type = EventType.create! valid_attributes
      delete event_type_url(event_type)
      expect(response).to redirect_to(event_types_url)
    end
  end
end

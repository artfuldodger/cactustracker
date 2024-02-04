require 'rails_helper'

RSpec.describe "/plants", type: :request do
  let(:user) { FactoryBot.create(:user) }

  let(:valid_attributes) {
    {
      user: user,
      nickname: 'Suzie',
      variety: 'Bridgesii',
      description: 'What a beaut!'
    }
  }

  let(:invalid_attributes) {
    {
      nickname: '',
      variety: '',
      description: ''
    }
  }

  before { sign_in(user) }

  describe "GET /new" do
    it "renders a successful response" do
      get new_plant_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      plant = Plant.create! valid_attributes
      get edit_plant_url(plant)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Plant" do
        expect {
          post plants_url, params: { plant: valid_attributes }
        }.to change(Plant, :count).by(1)
      end

      it "redirects to the created plant" do
        post plants_url, params: { plant: valid_attributes }
        expect(response).to redirect_to(user_plant_url(Plant.last.user, Plant.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Plant" do
        expect {
          post plants_url, params: { plant: invalid_attributes }
        }.to change(Plant, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post plants_url, params: { plant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          nickname: 'Suzie II'
        }
      }

      it "updates the requested plant" do
        plant = Plant.create! valid_attributes
        expect {
          patch plant_url(plant), params: { plant: new_attributes }
        }.to change { plant.reload.nickname }.from('Suzie').to('Suzie II')
      end

      it "redirects to the plant" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: new_attributes }
        plant.reload
        expect(response).to redirect_to(user_plant_url(plant.user, plant))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        plant = Plant.create! valid_attributes
        patch plant_url(plant), params: { plant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested plant" do
      plant = Plant.create! valid_attributes
      expect {
        delete plant_url(plant)
      }.to change(Plant, :count).by(-1)
    end

    it "redirects to the plants list" do
      plant = Plant.create! valid_attributes
      delete plant_url(plant)
      expect(response).to redirect_to(user_url(plant.user))
    end
  end
end

require 'rails_helper'

RSpec.describe "/measurements", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:plant) { FactoryBot.create(:plant, user: user) }

  let(:valid_attributes) {
    {
      plant: plant,
      date: '2023-02-21',
      size: 13,
      unit: 'in'
    }
  }

  let(:invalid_attributes) {
    {
      plant: plant,
      date: nil,
      size: nil,
      unit: nil,
    }
  }

  before { sign_in(user) }

  describe "GET /index" do
    it "renders a successful response" do
      Measurement.create! valid_attributes
      get plant_measurements_url(plant)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      measurement = Measurement.create! valid_attributes
      get plant_measurement_url(plant, measurement)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_plant_measurement_url(plant)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      measurement = Measurement.create! valid_attributes
      get edit_plant_measurement_url(plant, measurement)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Measurement" do
        expect {
          post plant_measurements_url(plant), params: {measurement: valid_attributes }
        }.to change(Measurement, :count).by(1)
      end

      it "redirects to the created measurement" do
        post plant_measurements_url(plant), params: {measurement: valid_attributes }
        expect(response).to redirect_to(plant_url(plant))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Measurement" do
        expect {
          post plant_measurements_url(plant), params: {measurement: invalid_attributes }
        }.to change(Measurement, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post plant_measurements_url(plant), params: {measurement: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          size: 14
        }
      }

      it "updates the requested measurement" do
        measurement = Measurement.create! valid_attributes
        expect {
          patch plant_measurement_url(plant, measurement), params: { measurement: new_attributes }
        }.to change { measurement.reload.size }.from(13).to(14)
      end

      it "redirects to the plant" do
        measurement = Measurement.create! valid_attributes
        patch plant_measurement_url(plant, measurement), params: { measurement: new_attributes }
        measurement.reload
        expect(response).to redirect_to(plant_url(plant))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        measurement = Measurement.create! valid_attributes
        patch plant_measurement_url(plant, measurement), params: { measurement: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested measurement" do
      measurement = Measurement.create! valid_attributes
      expect {
        delete plant_measurement_url(plant, measurement)
      }.to change(Measurement, :count).by(-1)
    end

    it "redirects to the plant" do
      measurement = Measurement.create! valid_attributes
      delete plant_measurement_url(plant, measurement)
      expect(response).to redirect_to(plant_url(plant))
    end
  end
end

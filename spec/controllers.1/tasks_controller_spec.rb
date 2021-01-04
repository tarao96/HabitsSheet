require 'rails_helper'

RSpec.describe TasksController, type: :controller do
    
    describe "GET #index"
        it "return http success" do
            get :index
            expect(response).to have_http_status(302)
        end
    end
    
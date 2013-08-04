require 'spec_helper'

describe ExamsController do

  describe "GET 'ledger'" do
    it "returns http success" do
      get 'ledger'
      response.should be_success
    end
  end

end

require 'rails_helper'

RSpec.describe Company, type: :model do

  before do
    @company = FactoryBot.build(:company)
  end

  describe "企業登録" do
    context "うまくいく時" do
      it "nameが存在する時" do
        expect(@company).to be_valid
      end
    end

    context "うまくいかない時" do
      it "nameが空の時" do
        @company.name = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが11字以上の時" do
        @company.name = "ABCDEFGHIJK"
        @company.valid?
        expect(@company.errors.full_messages).to include("Name is too long (maximum is 10 characters)")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Order, type: :model do
  
  before do
    @order = FactoryBot.build(:order)
  end

  describe "販売商品登録" do
    context "うまくいく時" do
      it "sales_numbersが存在する時、登録できる" do
        expect(@order).to be_valid
      end
    end

    context "うまくいかない時" do
      it "sales_numbersが空の時、登録できない" do
        @order.sales_numbers = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Sales numbers can't be blank")
      end
      it "sales_numbersが0の時、登録できない" do
        @order.sales_numbers = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Sales numbers must be greater than 0")
      end
    end
  end

end

require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe "商品登録" do
    context "上手くいく時" do
      it "カテゴリー、商品コード、商品名、在庫数、想定月間販売数が全てあれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "上手くいかない時" do
      it "カテゴリーが空なら登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーが1なら登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品コードが空なら登録できない" do
        @item.code = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Code can't be blank")
      end
      it "商品コードが9字以上なら登録できない" do
        @item.code = "A12345678"
        @item.valid?
        expect(@item.errors.full_messages).to include("Code is invalid")
      end
      it "商品名が空なら登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "在庫が空なら登録できない" do
        @item.stock = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Stock can't be blank")
      end
      it "在庫がマイナスなら登録できない" do
        @item.stock = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Stock must be greater than or equal to 0")
      end
      it "在庫が10000以上なら登録できない" do
        @item.stock = 10000
        @item.valid?
        expect(@item.errors.full_messages).to include("Stock must be less than 10000")
      end
      it "想定月間販売数が空なら登録できない" do
        @item.monthly_sales = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Monthly sales can't be blank")
      end
      it "想定月間販売数がマイナスなら登録できない" do
        @item.monthly_sales = -1
        @item.valid?
        expect(@item.errors.full_messages).to include("Monthly sales must be greater than or equal to 0")
      end
      it "想定月間販売数が10000以上なら登録できない" do
        @item.monthly_sales = 10000
        @item.valid?
        expect(@item.errors.full_messages).to include("Monthly sales must be less than 10000")
      end
    end
    
  end
end

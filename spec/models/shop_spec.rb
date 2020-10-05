require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = FactoryBot.build(:shop)
  end

  describe '店舗登録' do
    context 'うまくいく時' do
      it 'name, prefecture_id, delivery_daysが存在する時' do
        expect(@shop).to be_valid
      end
    end

    context 'うまくいかない時' do
      it 'nameが空だと登録できない' do
        @shop.name = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが11字以上だと登録できない' do
        @shop.name = 'ABCDEFGHIJK'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Name is too long (maximum is 10 characters)')
      end
      it 'prefecture_idが空だと登録できない' do
        @shop.prefecture_id = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと登録できない' do
        @shop.prefecture_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'delivery_daysが空だと登録できない' do
        @shop.delivery_days = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Delivery days can't be blank")
      end
      it 'delivery_daysが0だと登録できない' do
        @shop.delivery_days = 0
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Delivery days must be greater than 0')
      end
      it 'delivery_daysが100以上だと登録できない' do
        @shop.delivery_days = 100
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Delivery days must be less than 100')
      end
    end
  end
end

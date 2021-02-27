require 'rails_helper'
RSpec.describe UserOrder, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @user_order = FactoryBot.build(:user_order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '購入者情報' do
    context '購入者入力内容に問題がない場合' do
      it '必要事項を入力すれば登録できる' do
        expect(@user_order).to be_valid
      end
      it '建物名が無くても登録できる' do
        @user_order.building_name= nil
        expect(@user_order).to be_valid
      end
    end

    context '購入者入力内容に問題が有る場合' do
      it 'Tokenが空だと登録できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号が空だと登録できない' do
        @user_order.zip_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Zip number can't be blank"
      end
      it '郵便番号にハイフンがないと登録できない' do
        @user_order.zip_number = 1_111_111
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'Zip number is invalid. Include hyphen(-)'
      end
      it 'dispatch_area_idは1の場合登録できない' do
        @user_order.dispatch_area_id  = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'Dispatch area must be other than 1'
      end

      it '都道府県が空だと登録できない' do
        @user_order.dispatch_area_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Dispatch area can't be blank"
      end

      it '市区町村が空だと登録できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空だと登録できない' do
        @user_order.block_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Block number can't be blank"
      end

      it '電話番号が空だと登録できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号を11桁以上入力すると登録できない' do
        @user_order.phone_number = 111_111_111_111
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'Phone number を正しい電話番号を記入してください'
      end
      it '電話番号は英数混合では登録できないこと' do
        @user_order.phone_number = 'aaaa1111'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'Phone number is invalid. Input half-width characters.'
      end

      it 'user_idが空だと登録できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "User can't be blank"
      end

      it 'item_idが空だと登録できない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end

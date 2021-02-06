require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item) 
  end
   
  describe "出品物新規登録" do
    context "登録内容に問題がない場合" do

      it "必要事項を入力すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '登録内容に問題ある場合' do
      
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
        end

      it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it "nameの文字数が41文字以上だと登録できない" do
      @item.name = Faker::Lorem.characters(number:41)
      @item.valid?
      expect(@item.errors.full_messages).to include "Name 商品名が長すぎます"
      end

      it "explanationが空では登録できない" do
      @item.explanation = "" 
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it "explanationが1001文字以上では登録できない" do
      @item.explanation = Faker::Lorem.characters(number: 1001)
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation 商品の説明文が長すぎます"
      end

      it "category_idが空では登録できない" do
      @item.category_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it "status_idが空では登録できない" do
      @item.status_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it "shipping_charge_idが空では登録できない" do
      @item.shipping_charge_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end

      it "dispatch_area_idが空では登録できない" do
      @item.dispatch_area_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include "Dispatch area can't be blank"
      end

      it "shipping_duration_idが空では登録できない" do
      @item.shipping_duration_id = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping duration can't be blank"
      end

      it "priceが空では登録できない" do
      @item.price = ""  
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it "priceが300円未満では登録できない" do
      @item.price = "299"  
      @item.valid?
      expect(@item.errors.full_messages).to include "Price は300〜9,999,999円の範囲で入力してください"
      end

      it "priceが9,999,999円以上では登録できない" do
      @item.price = "10000000"  
      @item.valid?
      expect(@item.errors.full_messages).to include "Price は300〜9,999,999円の範囲で入力してください"
      end

      it "category_idが1では登録できない" do
        @item.category_id = "1"  
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
  
      it "status_idが1では登録できない" do
      @item.status_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
  
      it "shipping_charge_idが1では登録できない" do
      @item.shipping_charge_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge must be other than 1"
      end

      it "dispatch_area_idが1では登録できない" do
      @item.dispatch_area_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include "Dispatch area must be other than 1"
      end

      it "shipping_duration_idが1では登録できない" do
      @item.shipping_duration_id = "1"  
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping duration must be other than 1"
      end


    end

   end
 end

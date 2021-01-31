require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @other = FactoryBot.build(:user)
    @user = FactoryBot.build(:user)
  end
   
  describe "ユーザー新規登録" do
    context "登録内容に問題がない場合" do

      it "必要事項を入力すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '登録内容に問題ある場合' do

      it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空では登録できない" do
      @user.email = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "emailに@がなければ登録できない" do
        @user.email = "a.yahoo.co.jp"  
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
        end

      it "同じemailは登録できない" do
        @other.save
        @user.email = @other.email  
        @user.valid?
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end

      it "passwordが空では登録できない" do
      @user.password = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "パスワードとパスワード（確認用）、値の一致しない場合は登録できない" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa001"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "名字が空では登録できない" do
        @user.family_name = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it "名字がローマ字では登録できない" do
        @user.family_name = "a"  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name 全角ひらがな、全角カタカナ、漢字で入力してください"
      end
        
      it "名前が空では登録できない" do
        @user.first_name = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "名前がローマ字では登録できない" do
        @user.first_name = "a"  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角ひらがな、全角カタカナ、漢字で入力してください"
      end

      it "名字（カナ）が空では登録できない" do
        @user.family_name_kana= ""  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end

      it "名字（カナ）にひらがな登録できない" do
        @user.family_name_kana= "あ"  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana 全角カタカナで入力してください"
      end
      it "名字（カナ）にローマ字登録できない" do
        @user.family_name_kana= "a"  
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana 全角カタカナで入力してください"
      end

      it "名前（カナ）が空では登録できない" do
        @user.first_name_kana= ""  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "名前（カナ）にひらがなは登録できない" do
        @user.first_name_kana= "あ"  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カタカナで入力してください"
      end

      it "名前（カナ）にローマ字は登録できない" do
        @user.first_name_kana= "a"  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カタカナで入力してください"
      end

      it "誕生日が空では登録できない" do
        @user.birthday = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'passwordは半角ローマ字だけでは登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角アルファベットと数字をそれぞれ１文字以上入力してください"
      end

      it 'passwordは数字だけでは登録できない' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角アルファベットと数字をそれぞれ１文字以上入力してください"
      end
      it 'passwordは全角は登録できない' do
        @user.password = "AAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角アルファベットと数字をそれぞれ１文字以上入力してください"
      end

      it 'passwordは6文字以上でないと登録できない' do
        @user.password = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password は６文字以上入力してください")
      end

    end

   end
 end
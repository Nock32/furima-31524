require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   
  describe "ユーザー新規登録" do
     
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

     it "passwordが空では登録できない" do
      @user.password = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "名字が空では登録できない" do
      @user.family_name = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
      
      it "名前が空では登録できない" do
      @user.first_name = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "名字（カナ）が空では登録できない" do
      @user.family_name_kana= ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end

    it "名前（カナ）が空では登録できない" do
      @user.first_name_kana= ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it "誕生日が空では登録できない" do
      @user.birthday = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end

    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
    end

    it 'passwordは6文字以上' do
      @user.password = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password is too short (minimum is 6 characters)")
    end

   end
 end
require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'do
  context 'できるとき'do
    
  end
  context '登録できないとき'do
    it "nicknameが空だと登録できない" do
      
    end
    it "emailが空だと登録できない" do
      
    end
    it "@マークの無いアドレスは登録できない" do
      
    end
    it "emailの一意性"do
      
    end
    it "passwordが空では登録できない" do
      
    end
    it "passwordが５文字以下の場合、登録できない" do
      
    end
    it "passwordが半角数字のみでは登録できない" do
      
    end
    it "passwordが全角英数字では登録できない" do
      
    end
    it "first_nameが空では登録できない" do
      
    end
    it "first_nameがアルファベットでは登録できない" do
      
    end
    it "last_name_kanaが空では登録できない" do
      
    end
    it "last_name_kanaがアルファベットでは登録できない" do
      
    end
    it "first_name_kanaが空では登録できない" do
      
    end
    it "first_name_kanaがアルファベットでは登録できない" do
      
    end
    it "first_name_kanaが平仮名では登録できない" do
      
    end
    it "last_name_kanaが空では登録できない" do
      
    end
    it "last_name_kanaがアルファベットでは登録できない" do
      
    end
    it "birth_dateが空では登録できない" do
      
    end
  end
  end
end

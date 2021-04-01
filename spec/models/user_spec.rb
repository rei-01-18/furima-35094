require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '正常に新規登録ができる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailの@が抜けていては登録できない' do
      @user.email = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it 'emailが重複していては保存できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password")
    end
    it 'passwordが５文字以下では登録できない' do
      @user.password = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
    end
    it 'passwordが全角数字では登録できない' do
      @user.password = '１１１aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid") 
    end
    it 'passwordが全角数字では登録できない' do
      @user.password = '111あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid") 
    end
    it 'passwordが英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end
    it 'passwordとpassword_confirmationが同じでなければ登録できない' do
      @user.password = '111aaa'
      @user.password_confirmation = '2222aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end
    it 'last_nameがふりがな、カタカナ、漢字以外では保存できない' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end
    it 'first_nameがふりがな、カタカナ、漢字以外では保存できない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'first_nameがふりがな、カタカナ、漢字以外では保存できない' do
      @user.first_name = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_name_furiganaが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end
    it 'last_name_furiganaがカタカナ以外では保存できない' do
      @user.last_name_furigana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana is invalid")
    end
    it 'last_name_furiganaがカタカナ以外では保存できない' do
      @user.last_name_furigana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana is invalid")
    end
    it 'last_name_furiganaがカタカナ以外では保存できない' do
      @user.last_name_furigana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana is invalid")
    end
    it 'last_name_furiganaがカタカナ以外では保存できない' do
      @user.last_name_furigana = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana is invalid")
    end
    it 'first_name_furiganaが空では登録できない' do
      @user.first_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank", "First name furigana is invalid")
    end
    it 'first_name_furiganaがカタカナでは保存できない' do
      @user.first_name_furigana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana is invalid")
    end
    it 'first_name_furiganaがカタカナでは保存できない' do
      @user.first_name_furigana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana is invalid")
    end
    it 'first_name_furiganaがカタカナでは保存できない' do
      @user.first_name_furigana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana is invalid")
    end
    it 'first_name_furiganaがカタカナでは保存できない' do
      @user.first_name_furigana = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana is invalid")
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
 
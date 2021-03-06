require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(0.3)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも保存できないこと' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが全角では保存できないこと' do
        @purchase_address.postal_code = '０００-００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)") 
      end
      it 'postal_codeがハイフンなしでは保存できないこと' do
        @purchase_address.postal_code = '０００-００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)") 
      end
      it 'prefecture_idが1だと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numbeが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numbeが全角数字だと保存できないこと' do
        @purchase_address.phone_number = '０００００００００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numbeが全角ひらがなだと保存できないこと' do
        @purchase_address.phone_number = 'あああああああああああ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numbeが全角カタカナだと保存できないこと' do
        @purchase_address.phone_number = 'アアアアアアアアアアア'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numbeが全角漢字だと保存できないこと' do
        @purchase_address.phone_number = '嗚呼嗚呼嗚呼嗚呼嗚呼嗚'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numbeが全角英語だと保存できないこと' do
        @purchase_address.phone_number = 'ａａａａａａａａａａａａ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numbeが半角英語だと保存できないこと' do
        @purchase_address.phone_number = 'aaaaaaaaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numbeがハイフンありだと保存できないこと' do
        @purchase_address.phone_number = '000-0000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'user_idが空だと保存できないこと' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


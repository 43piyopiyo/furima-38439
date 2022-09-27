require 'rails_helper'
RSpec.describe OrderShipAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_ship_address = FactoryBot.build(:order_ship_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it '必要事項を入力すれば登録できる' do
        expect(@order_ship_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_ship_address.apartment = ''
        expect(@order_ship_address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_ship_address.user_id = nil
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_ship_address.item_id = nil
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_ship_address.postal_code = ' '
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが含まれないと保存できない' do
        @order_ship_address.postal_code = '1234567'
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が空だと保存できない' do
        @order_ship_address.prefecture_id = nil
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_ship_address.prefecture_id = 0
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_ship_address.city = ' '
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_ship_address.address_detail = ' '
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Address detail can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_ship_address.phone_number = ' '
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが含まれると保存できない' do
        @order_ship_address.phone_number = '090-1234-5678'
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下だと保存できない' do
        @order_ship_address.phone_number = '090123456'
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上だと保存できない' do
        @order_ship_address.phone_number = '090123456789'
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空だと保存できないこと' do
        @order_ship_address.token = nil
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
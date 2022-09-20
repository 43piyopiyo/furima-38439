require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context '商品出品ができるとき' do
      it "必要事項を入力すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "detailが空だと出品できない" do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idのid:1を選択すると出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空だと出品できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idのid:1を選択すると出品できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "delivery_free_idが空だと出品できない" do
        @item.delivery_free_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery free can't be blank")
      end
      it "delivery_free_idのid:1を選択すると出品できない" do
        @item.delivery_free_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery free can't be blank")
      end
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idのid:1を選択すると出品できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_day_idが空だと出品できない" do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "shipping_day_idのid:1を選択すると出品できない" do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceは¥300より安いと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater_than_or_equal_to 300")
      end
      it "priceは¥10,000,000以上だと出品できない" do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less_than_or_equal_to 9999999")
      end
      it "priceは英字だと出品できない" do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price should be half-width numbers")
      end
      it "priceは全角だと出品できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price should be half-width numbers")
      end
      it "userが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.build(item_id: item.id, user_id: seller.id)
    item.save
    @order = FactoryBot.build(:pay_form, item_id: @item, user_id: buyer.id)

    # @user = FactoryBot.create(:user)
    # @item = FactoryBot.create(:item)
    # @order = FactoryBot.build(:pay_form, user_id: @user, item_id: @item)
  end
  describe '商品購入' do
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@order).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_code: 必須' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include()
      end
      it 'postal_code:ハイフンがない'do
      end
      it 'postal_code:文字が混じっている'do
      end
    end
  end
end

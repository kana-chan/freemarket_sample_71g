require 'rails_helper'

describe Item do
  describe '#create' do

    it "名前がありませんわ" do
      item = build(:item, name: "")
      item.valid?
      expect(item[:name])
    end

    it "説明文がありませんわ" do
      item = build(:item, explaination: "")
      item.valid?
      expect(item[:explaination])
    end

    it "商品状態がありませんわ" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item[:condition_id])
    end

    it "発送日がありませんわ" do
      item = build(:item, shipment_id: "")
      item.valid?
      expect(item[:shipment_id])
    end

    it "どちらが負担するかの記述がありませんわ" do
      item = build(:item, responsibility_id: "")
      item.valid?
      expect(item.errors[:responsibility_id])
    end

    it "値段がありませんわ" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price])
    end

    it "発送地がありませんわ" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id])
    end

  end
end

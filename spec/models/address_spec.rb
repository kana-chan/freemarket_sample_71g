require 'rails_helper'

describe Address do
  describe '#create' do

    # 1. zipが空では登録できないこと
    it "is invalid without a zip" do
      address = build(:address, zip: nil)
      address.valid?
      expect(address.errors[:zip]).to include("can't be blank")
    end

    # 2. prefecture_idが空では登録できないこと
    it "is invalid without an prefecture_id" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

    # 3. cityが空では登録できないこと
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    # 4. streetが空では登録できないこと
    it "streetが空では登録できないこと" do
      address = build(:address, street: nil)
      address.valid?
      expect(address.errors[:street]).to include("can't be blank")
    end

    # 5. first_name_adが空では登録できないこと
    it "is invalid without a first_name_ad" do
      address = build(:address, first_name_ad: nil)
      address.valid?
      expect(address.errors[:first_name_ad]).to include("can't be blank")
    end

    # 6. last_name_adが空では登録できないこと
    it "last_name_adが空では登録できないこと" do
      address = build(:address, last_name_ad: nil)
      address.valid?
      expect(address.errors[:last_name_ad]).to include("can't be blank")
    end

    # 7. first_furigana_adが空では登録できないこと
    it "is invalid without a first_furigana_ad" do
      address = build(:address, first_furigana_ad: nil)
      address.valid?
      expect(address.errors[:first_furigana_ad])
    end

    # 8. last_furigana_adが空では登録できないこと
    it "is invalid without an last_furigana_ad" do
      address = build(:address, last_furigana_ad: nil)
      address.valid?
      expect(address.errors[:last_furigana_ad]).to include("can't be blank")
    end
  end
end
require 'rails_helper'

describe User do
  describe '#create' do

    # 1. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname])
    end

    # 2. emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 3. first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 4. first_nameが半角では登録できないこと
    it "ifirst_nameが半角では登録できないこと" do
      user = build(:user, first_name: "aaa")
      user.valid?
      expect(user.errors[:first_name])
    end

    # 5. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 6. last_nameが半角では登録できないこと
    it "last_nameが半角では登録できないこと" do
      user = build(:user, last_name: "aaa")
      user.valid?
      expect(user.errors[:last_name])
    end

    # 7. first_furiganaが空では登録できないこと
    it "is invalid without a first_furigana" do
      user = build(:user, first_furigana: nil)
      user.valid?
      expect(user.errors[:first_furigana]).to include("can't be blank")
    end

    # 8. first_furiganaが半角では登録できないこと
    it "first_furiganaが半角では登録できないこと" do
      user = build(:user, first_furigana: "aaa")
      user.valid?
      expect(user.errors[:first_furigana])
    end

    # 9. last_furiganaが空では登録できないこと
    it "is invalid without a last_furigana" do
      user = build(:user, last_furigana: nil)
      user.valid?
      expect(user.errors[:last_furigana]).to include("can't be blank")
    end

    # 10. last_furiganaが半角では登録できないこと
    it "last_furiganaが半角では登録できないこと" do
      user = build(:user, last_furigana: "aaa")
      user.valid?
      expect(user.errors[:last_furigana])
    end

    # 11. phone_numberが空では登録できないこと
    it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    # 12. genderが空では登録できないこと
    it "is invalid without a gender" do
      user = build(:user, gender: nil)
      user.valid?
      expect(user.errors[:gender]).to include("can't be blank")
    end

    # 13. imageが空では登録できないこと
    it "is invalid without a image" do
      user = build(:user, image: nil)
      user.valid?
      expect(user.errors[:image]).to include("can't be blank")
    end


    # 14. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user)
    end

    # 15. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end




  end
end
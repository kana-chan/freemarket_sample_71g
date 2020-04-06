require 'rails_helper'

describe Item do
  describe '#update' do
    it "is valid with a name, explaination, condition_id, responsibility_id, 
        prefecture_id, shipment_id, category_id, user_id, price" do
      # user = create(:user)
      item = FactoryBot.build(:item, user_id: user[:id], category_id: category[:id], image_id: image[:id])
      category = create(:category)
      image = create(:image)
      binding.pry
      expect(item).to be_valid
    end
  end
end
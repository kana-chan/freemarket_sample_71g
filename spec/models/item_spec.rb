require 'rails_helper'

describe Item do
  describe '#update' do
    it "is valid with a name, explaination, condition_id, responsibility_id, 
        prefecture_id, shipment_id, category_id, user_id, price" do
      # item = build(:item)
      # item = build(:item_with_image)
      user = build(:user)
      item = build(:item, user_id: user.id)
      item.images.build(src: "job_takuhaiin_man.png")
      item.save
    end
  end
end

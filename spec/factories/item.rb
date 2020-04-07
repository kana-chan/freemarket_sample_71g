FactoryBot.define do
   
  factory :item do
    user
    category
    name                    {"test"}
    explaination            {"素晴らしい"}
    user_id                 {1}
    responsibility_id       {1}
    shipment_id             {1}
    condition_id            {1}
    prefecture_id           {1}
    price                   {1000}

    factory :item_with_image do
      after(:create) do | item |
        create(:image, item: item)
      end
    end
  end
end
FactoryBot.define do

  factory :item, class: Item do
    user
    name                    {"test"}
    explaination            {"素晴らしい"}
    user_id                 {1}
    responsibility_id       {1}
    shipment_id             {1}
    condition_id            {1}
    prefecture_id           {1}
    price                   {1000}
  end

end
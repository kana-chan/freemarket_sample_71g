FactoryBot.define do

  factory :item do
    name                  {"みかん"}
    explaination          {"美味しい"}
    condition_id          {"2"}
    shipment_id           {2}
    responsibility_id     {2}
    price                 {122}
    prefecture_id         {11}
    brand                 {"supreme"}

  end

end
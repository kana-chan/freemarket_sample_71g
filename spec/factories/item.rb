FactoryBot.define do

  # factory :user do
  #   nickname                {"やまーだ"}
  #   email                   {"kkk@gmail.com"}
  #   first_name              {"山田"}
  #   last_name               {"太郎"}
  #   first_furigana          {"やまだ"}
  #   last_furigana           {"たろう"}
  #   birthday                {"2020-12-12"}
  #   phone_number            {"1234567891"}
  #   gender                  {"male"}
  #   image                   {"056_thum-535x356.jpg"}
  #   password                {"00000000"}
  #   password_confirmation   {"00000000"}
  # end

  factory :image do
    src                     {"job_takuhaiin_man.png"}
    item_id                 {8}
  end

  factory :category do
    name {"ジャケット"}
  end

  factory :item do
    name                    {"test"}
    explaination            {"素晴らしい"}
    condition_id            {1}
    resposibility_id        {1}
    prefecture_id           {1}
    shipment_id             {1}
    category_id             {1}
    user_id                 {1}
    price                   {1000}
  end

end
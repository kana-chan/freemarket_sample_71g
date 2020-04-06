FactoryBot.define do

  factory :user do
    nickname              {"やまーだ"}
    email                 {"kkk@gmail.com"}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_furigana        {"やまだ"}
    last_furigana         {"たろう"}
    phone_number          {"1234567891"}
    gender                {"male"}
    image                 {"job_takuhaiin_man.png"}
    password              {"00000000"}
    password_confirmation {"00000000"}

  end

end
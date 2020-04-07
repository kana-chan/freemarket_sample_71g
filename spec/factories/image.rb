FactoryBot.define do

  factory :image do
    association :item, factory: :item
    src                     {"job_takuhaiin_man.png"}
    item_id                 {8}
  end
end
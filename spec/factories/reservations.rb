FactoryBot.define do
  factory :reservation do
    user nil
    listing nil
    start_date "2018-04-23 20:16:55"
    end_date "2018-04-23 20:16:55"
    start_time "2018-04-23 20:16:55"
    end_time "2018-04-23 20:16:55"
    price 1
    total 1
    menu "MyString"
  end
end

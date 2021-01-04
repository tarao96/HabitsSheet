FactoryBot.define do
    factory :user do
        name { 'テストユーザー' }
        email { 'test1@example.com' }
        password { 'test1' }
    end
end
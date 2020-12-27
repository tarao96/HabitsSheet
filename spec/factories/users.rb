FactoryBot.define do
    factory :user do
        name { 'テストユーザー' }
        email { 'test1@example.com' }
        password { '' }
    end
end
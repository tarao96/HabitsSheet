FactoryBot.define do
    factory :task do
        name { 'テストを書く' }
        purpose { '正常に動作するかの確認のため' }
        user
    end
end
FactoryBot.define do
    factory :checklist do
        date { '2020/01/04' }
        try { 'テスト投稿' }
        review { '4.0' }
        comment { 'テスト' }
        user
    end
end
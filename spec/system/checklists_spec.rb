require 'rails_helper'

describe 'チェックリスト管理機能', type: :system do
    describe 'チェックリスト一覧表示、編集、削除機能' do
         let(:user_c) { FactoryBot.create(:user, name: 'ユーザーC', email: 'c@example.com', password: 'testC') }
         
         before do 
             FactoryBot.create(:task, name: '最初のタスク', user: user_c)
             FactoryBot.create(:checklist, date: '2020/01/04', try: 'テスト', task_id: 1, user_id: 1)
             visit login_path
             fill_in 'メールアドレス', with: 'c@example.com'
             fill_in 'パスワード', with: 'testC'
             click_button 'ログインする'
             visit tasks_path
             click_on 'チェックリスト'
         end
         
         shared_examples_for 'ユーザーCが作成したタスクが表示される' do
             it { expect(page).to have_content '2020/01/04', 'テスト'}
         end
         
         context '一覧表示機能' do
            let(:login_user) { user_c }
            it_behaves_like 'ユーザーCが作成したタスクが表示される'
         end
         
         context '編集機能' do
             it '編集画面が表示される' do
                 click_on '編集'
                 expect(page).to have_content 'チェックリストの編集'
             end
             
             it 'チェックリストの編集が成功する' do
                 click_on '編集'
                 fill_in '今日の対策案', with: 'テスト投稿'
                 click_on '更新する'
                 visit checklists_path
             expect(page).to have_content 'テスト投稿'
             end
         
          context '削除機能' do
              it 'チェックリストの削除が成功する' do
                  click_on '削除'
                  page.driver.browser.switch_to.alert.accept
                  expect(page).to have_content '「2020/01/04」を削除しました。'
              end
          end
         end
     end
 end
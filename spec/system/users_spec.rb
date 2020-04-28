require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe "ユーザー機能" do
    before do
      visit new_user_path
      fill_in "user_name", with: "test User1"
      fill_in "user_email", with: "test1@example.com"
      fill_in "user_password", with: "testtest"
      fill_in "user_password_confirmation", with: "testtest"
      click_button "登録する"
    end
    context "サインアップした場合" do
      it "ユーザー詳細画面に遷移すること" do
        expect(page).to have_content "ユーザーを登録しました！"
      end
    end
    context "サインインした場合" do
      before do
        User.create(name: 'test User2', 
                    email: 'test2@example.com', 
                    password: 'testtest', 
                    password_confirmation: 'testtest')
      end
      it "ユーザー詳細画面に遷移すること" do
        click_link "ログアウト"
        fill_in "session_email", with: "test2@example.com"
        fill_in "session_password", with: "testtest"
        click_button "保存する"
        expect(page).to have_content "ログインに成功しました！"
      end
    end
    context "マイページに遷移した場合" do
      it "マイページ画面に遷移されること" do
        click_link "プロフィール"
        expect(page).to have_content "マイページ"
      end
    end
    context "ログアウトした場合" do
      it "ログイン画面に遷移されること" do
        click_link "ログアウト"
        expect(page).to have_content "ログアウトしました！"
      end
    end
  end
end
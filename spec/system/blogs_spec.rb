require 'rails_helper'

RSpec.describe 'Blogs', type: :system do
  describe "ブログ機能" do
    before do
      visit new_user_path
      fill_in "user_name", with: "test User1"
      fill_in "user_email", with: "test1@example.com"
      fill_in "user_password", with: "testtest"
      fill_in "user_password_confirmation", with: "testtest"
      click_button "登録する"
      click_link "ブログ一覧"
      click_link "投稿"
      fill_in "blog_title", with: "test Title1"
      fill_in "blog_content", with: "test Content1"
      click_button "登録する"
    end

    context "新規投稿した場合" do
      it "投稿した内容が表示されること" do
        expect(page).to have_content "test Title1"
        expect(page).to have_content "test Content1"
      end
    end

    context "投稿内容の詳細に遷移した場合" do
      it "詳細画面が表示されること" do
        click_link "test Title1"
        expect(page).to have_content "test Title1"
        expect(page).to have_content "test Content1"
      end
    end

    context "投稿内容を編集した場合" do
      it "編集内容が表示されること" do
        click_link "test Title1"
        click_link "編集"
        fill_in "blog_title", with: "test Title1 update"
        fill_in "blog_content", with: "test Content1 update"
        click_button "更新する"
        expect(page).to have_content "test Title1 update"
        expect(page).to have_content "test Content1 update"
        
      end
    end

    context "投稿を削除した場合" do
      it "削除した内容が表示されていないこと" do
        click_link "test Title1"
        click_link "削除"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "ブログを削除しました！"
        expect(page).to_not have_content "test Title1"
        expect(page).to_not have_content "test Content1"
      end
    end

  end
end
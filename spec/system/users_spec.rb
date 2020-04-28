require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe "サインアップ機能" do
    context "サインアップした場合" do
      it "ユーザー詳細画面に遷移すること" do
        fill_in "user_name", with: "test User1"
        fill_in "user_email", with: "test1@example.com"
        fill_in "user_password", with: "testtest"
        fill_in "user_password_confirmation", with: "testtest"
      end
    end
  end
end
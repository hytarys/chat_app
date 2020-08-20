require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    #トップページに遷移する
    visit root_path
    #ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインし成功し、トップページに移動する' do
    #予めユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    #トップページに移動する
    visit root_path
    #ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
    #既に保存されているユーザーのemailとpasswordを入力する
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    #ログインボタンをクリックする
    # find('input[name= "commit"]').clickこれも合ってる
    click_on ('Log')
    #トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    #予めユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    #トップページに遷移する
    visit root_path
    #ログインしていない場合、サインインページに移動する
    expect(current_path).to eq new_user_session_path
    #誤ったユーザー情報を入力する
    fill_in 'Email', with:"11111111"
    fill_in 'Password', with:"111111111123"
    #ログインボタンをクリックする
    click_on 'Log'
    #サインインページに戻って来ていることを確認する
    expect(current_path).to eq new_user_session_path
  end

end

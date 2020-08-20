require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end
  it 'チャットルームを削除すると、関連メッセージが削除されていること' do
    #サインインする
    sign_in(@room_user.user)
    #作成されたチャットルームに移動する
    click_on(@room_user.room.name)
    #メッセージ情報を5つ追加する
    FactoryBot.create_list(:message, 5, room_id: @room_user.room.id, user_id: @room_user.user.id)
    # def message
    #   post = "test"
    #   fill_in 'message_content',with: post
    #   expect {
    #     find('input[name="commit"]').click
    #   }.to change {Message.count}.by(1)
    # end
    # .message
    # .message
    # .message
    # .message
    # .message
    #チャットを終了するボタンを押すと作成した5つのメッセージが削除されている
    expect{
      find('チャットルームを削除する').click
    }.to change{Message.count}.by(-5)
    #トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
end

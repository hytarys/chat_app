class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)#roomとmessageは親子構造になっていて、アソシエーションも組んでいるので.messagesが使える
    if
      @message.save
      redirect_to room_messages_path
    else
      @messages = @room.messages.includes(:user)#indexコントローラーを経由せずにrenderでindex.html.erbに飛ばされるのでこの記述がないとエラーが起きる
      render :index
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end

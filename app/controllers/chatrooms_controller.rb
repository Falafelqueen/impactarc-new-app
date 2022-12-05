class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.new
    @chatrooms = current_user.chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @user = @chatroom.users.find { |user| user != current_user }
  end

  def create
    user = User.find(params[:user_id])

    if @chatroom = current_user.chatrooms.find { |chatroom| chatroom.users.include?(user) }
      redirect_to chatroom_path(@chatroom)
    else
      @chatroom = Chatroom.new(name: "#{user.email}")
      current_user.chatrooms << @chatroom
      user.chatrooms << @chatroom
      @chatroom.save
      InboxChannel.broadcast_to(
        user,
        render_to_string(partial: "chatrooms/chat_preview", locals: {chatroom: @chatroom})
      )
      redirect_to chatroom_path(@chatroom)
    end
  end
end

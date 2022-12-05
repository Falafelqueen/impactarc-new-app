class InboxChannel < ApplicationCable::Channel
  def subscribed
   stream_for User.find(params[:user_id])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

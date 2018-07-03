class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_converstaion

  def index
    if current_user == @conversation.sender || current_user == @conversation.recipient
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
      @messages == @conversation.messages.order('created_at DESC')
    else
      redirect_to conversations_path, alert: "他人のメッセージにアクセスできません"
  end

  def create
    @message = @conversation.message.new(message_params)
    @messages = @conversation.messages.order("created_at DESC")

    if @message.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end

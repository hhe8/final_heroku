class Message < ActiveRecord::Base
  belongs_to :messages_received, foreign_key: :receiver_id, class_name: "User"
  belongs_to :message_sent, foreign_key: :sender_id, class_name: "User"
end

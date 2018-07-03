class Conversation < ApplicationRecord
  belongs_to :sender, forgeign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, forgeign_key: :recipient_id, class_name: 'user'
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :involving, -> (user) do
    where("conversations.sender_id =? OR conversations.recipient_id =?", user.id, user.id)
  end
  scope :between,  -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)",sender_id, recipient_id,  sender_id, recipient_id)
  end
end

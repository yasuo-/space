class User
  def self.from_token_payload(payload)
    new(payload)
    # or
    # self.find payload["sub"]
  end
end

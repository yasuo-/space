class HostPhoto < ApplicationRecord
  belongs_to :room
  has_attached_file :photo, 
  	:styles => { medium: "300x300>", thumb: "100x100>" }, # 画像サイズを指定
	  :url  => "/assets/arts/:id/:style/:basename.:extension", # 画像保存先のURL先
	  :path => "#{Rails.root}/public/assets/arts/:id/:style/:basename.:extension" # サーバ上の画像保存先パス


  validates_attachment :photo,
      presence: true,  # ファイルの存在チェック
      less_than: 5.megabytes, # ファイルサイズのチェック
end

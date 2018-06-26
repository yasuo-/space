
10.times do |index|
  image_path = File.join(Rails.root, "/assets/images/dummy/dummy0#{index}.jpg")
  image = File.open(image_path, 'rb').read
  photo = Photo.new(
    listing_id:index,
    photo_file_name:image_path,
    photo_content_type: "jpeg"
    )
  photo.save!
end

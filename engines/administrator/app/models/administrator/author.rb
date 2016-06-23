module Administrator
  class Author < ::Author

    validates_presence_of :name, :avatar

    validates :avatar, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :avatar, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }

    mount_uploader :avatar, Administrator::AvatarUploader

  end
end

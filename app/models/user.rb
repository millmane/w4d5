# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  session_token :string           not null
#  password      :string           not null
#  username      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base

  validates(
    :username,
    :password_digest,
    :session_token,
    presence: true
    )

  validates(
    :password, length: { minimum: 6, allow_nil: true }
  )
end

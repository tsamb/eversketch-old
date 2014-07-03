require 'rails_helper'

describe User, :type => :model do

  it "validates password presence" do
    no_pw_user = User.new(username: "testuser")

    expect{no_pw_user.save!}.to raise_error(/Password can't be blank/)
  end

  it "validates password length greater than 8 characters" do
    short_pw_user = User.new(username: "testuser", password: "shortpw")

    expect{short_pw_user.save!}.to raise_error(/Password is too short \(minimum is 8 characters\)/)
  end

  it "validates uniqueness of username" do
    User.create!(username: "uniquename", password:"password")
    copycat = User.new(username: "uniquename", password:"password")

    expect{copycat.save!}.to raise_error(/Username has already been taken/)
  end

end

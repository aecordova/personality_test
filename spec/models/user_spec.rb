require 'rails_helper'


RSpec.describe User, type: :model do
  context "with valid data" do
    let(:guest_user) { build(:guest_user) }
    let(:registered_user) { build(:registered_user) }
    let(:admin_user) { build(:admin_user) }

    it "should be valid" do
      expect(guest_user).to be_valid
      expect(registered_user).to be_valid
      expect(admin_user).to be_valid
    end
  end

  describe "guest_user" do
    it "just requires a name" do
      guest_user = User.new(name: "Guest")
      expect(guest_user).to be_valid
    end
  end

  describe "admin_user" do
    it "requires name, valid email, password and password_confirmation" do
      admin_user = User.new(name: "Admin", role: "admin")
      expected_errors = [
        "Email can't be blank", 
        "Email is invalid", 
        "Password can't be blank", 
        "Password is too short (minimum is 6 characters)"
      ]

      expect(admin_user.valid?).to be false
      expect(admin_user.errors.full_messages).to match(expected_errors)
    end
  end

  describe "registered_user" do
    it "requires name, valid email, password and password_confirmation" do
      admin_user = User.new(name: "User", role: "user")
      expected_errors = [
        "Email can't be blank", 
        "Email is invalid", 
        "Password can't be blank", 
        "Password is too short (minimum is 6 characters)"
      ]

      expect(admin_user.valid?).to be false
      expect(admin_user.errors.full_messages).to match(expected_errors)
    end
  end
end

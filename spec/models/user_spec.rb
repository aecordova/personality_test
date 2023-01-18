require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe "guest user" do
      let(:user) {create :guest_user }
  
      it { user.should validate_presence_of(:name) }
      it { user.should_not validate_presence_of(:email) }
      it { user.should_not validate_presence_of(:password) }
    end

    describe "admin user" do
      let(:user) { build :admin_user }
  
      it { user.should validate_presence_of(:name) }
      it { user.should validate_presence_of(:email) }
      it { user.should validate_presence_of(:password) }
      it { user.should_not allow_value("bleep").for(:email) } 
      it { user.should allow_value("user@mail.com").for(:email) } 
    end

    describe "normal/registered user" do
      let(:user) { build :registered_user }
  
      it { user.should validate_presence_of(:name) }
      it { user.should validate_presence_of(:email) }
      it { user.should validate_presence_of(:password) }
      it { user.should_not allow_value("bleep").for(:email) } 
      it { user.should allow_value("user@mail.com").for(:email) } 
    end
  end
end

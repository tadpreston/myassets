require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    should have_db_column(:first_name).of_type(:string)
    should have_db_column(:last_name).of_type(:string)
    should have_db_column(:username).of_type(:string)
    should have_db_column(:email).of_type(:string)
    should have_db_column(:password_digest).of_type(:string)
    should have_db_index([:email]).unique(true)
    should have_db_index([:username]).unique(true)
  end
  it { should have_secure_password }

  it do
    should validate_presence_of(:email)
    should validate_presence_of(:username)
  end

  it { should have_many(:spaces) }

  describe ".authenticate" do
    let(:password) { "supersekret" }
    let(:email) { "test@testing.com" }

    context "with valid user and credentials" do
      it "returns a user" do
        expect(User.authenticate(email, password)).to be_a(User)
      end
      it "returns the correct user" do
        expect(User.authenticate(email, password)).to eq(User.find_by(email: email))
      end
    end

    context "with invalid credentials" do
      let(:bad_password) { "badpassword" }
      let(:bad_email) { "bad@email.com" }

      it "returns nil with a bad password" do
        expect(User.authenticate(email, bad_password)).to be_nil
      end
      it "returns nil with a bad email" do
        expect(User.authenticate(bad_email, password)).to be_nil
      end
    end
  end
end

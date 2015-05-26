require 'spec_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:activation_digest) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email)}
  it { should validate_confirmation_of(:password) }

  it { should be_valid }

  it { should allow_value('example@domain.com').for(:email) }

  # we test the auth_token is unique
  ##it { should validate_uniqueness_of(:auth_token)}

  ##it { should have_many(:products) }


  describe "#products association" do
    before do
      @user.save
      ## 3.times { FactoryGirl.create :product, user: @user }
    end

    ## it "destroys the associated products on self destruct" do
      ## products = @user.products
      ## @user.destroy
      ## products.each do |product|
        ## expect(Product.find(product)).to raise_error ActiveRecord::RecordNotFound
      ## end
    ## end
  end

end

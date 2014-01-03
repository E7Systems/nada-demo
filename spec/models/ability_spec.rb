require 'spec_helper'

describe Ability do

  describe "Admin" do
    it "can manage everything" do
      ability = Ability.new(build :admin)
      expect(ability).to be_able_to(:manage, :all)
    end
  end
  context "User" do

    it "should be able to edit it's own details" do
      pending
      user = create :user
      ability = Ability.new(user)
      expect(ability).to be_able_to :update, user
    end

    it "should not be able to edit others details" do
      pending
      user = create :user
      ability = Ability.new(user)

      user_to_update = create :user
      expect(ability).to_not be_able_to :update, user_to_update
    end
  end



end

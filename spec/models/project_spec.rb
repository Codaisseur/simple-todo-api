require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "relations" do
    it { is_expected.to have_many(:todos) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end
end

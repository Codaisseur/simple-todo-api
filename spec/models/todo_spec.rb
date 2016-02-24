require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:project) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:project) }
  end
end

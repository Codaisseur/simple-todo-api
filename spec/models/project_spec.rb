require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "relations" do
    it { is_expected.to have_many(:todos) }
  end
end

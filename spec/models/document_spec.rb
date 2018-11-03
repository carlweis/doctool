require 'rails_helper'

RSpec.describe Document, type: :model do

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }

    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:state) }

    it { should validate_presence_of(:permalink) }
    it { should validate_uniqueness_of(:permalink) }
  end
end

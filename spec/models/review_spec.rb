require 'rails_helper'
describe Review, type: :model do
  describe 'Validations' do
    # via shoulda-matcher gem
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:score) }
    it { should validate_numericality_of(:score).only_integer }
    it { should validate_numericality_of(:score).is_greater_than_or_equal_to(1) }
    it { should validate_numericality_of(:score).is_less_than_or_equal_to(5) }
    # Note here validate has no S, but in the model we use validateS
  end
  describe 'Relationship' do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end
 end

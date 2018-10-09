require 'rails_helper'
describe Review, type: :model do
  describe 'Validations' do
    # via shoulda-matcher gem
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:score) }
    # Note here validate has no S, but in the model we use validateS
  end
  describe 'Relationship' do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end
 end

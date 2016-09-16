require 'rails_helper'

RSpec.describe Competence, type: :model do
  describe 'save' do
    before(:each) { @competence = FactoryGirl.create :competence }

    it 'valid with all fields' do
      expect(@competence.save).to be_truthy
    end

    it 'not valid without name' do
      @competence.name = nil
      expect(@competence.save).not_to be_truthy
    end

    it 'valid with long name' do
      @competence.name = 'a' * 255
      expect(@competence.save).to be_truthy
    end

    it 'not valid with too long name' do
      @competence.name = 'a' * 256
      expect(@competence.save).not_to be_truthy
    end
  end
end

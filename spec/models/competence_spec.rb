require 'rails_helper'

RSpec.describe Competence, type: :model do
  before(:all) { @competence = FactoryGirl.create :competence }
  after(:all) { Competence.delete_all }

  subject { @competence }

  it { should respond_to :name }

  describe 'save' do

    it { should be_valid }

    describe 'not valid without name' do
      before { @competence.name = nil }
      it { should_not be_valid }
    end

    describe 'valid with long name' do
      before { @competence.name = 'a' * 255 }

      it { should be_valid }
    end

    describe 'not valid with too long name' do
      before { @competence.name = 'a' * 256 }

      it { should_not be_valid }
    end
  end
end

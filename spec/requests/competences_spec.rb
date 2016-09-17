require 'rails_helper'

RSpec.describe "Competences", type: :request do
  subject { page }
  let(:competence) { FactoryGirl.create(:competence) }

  describe 'visit /competences' do
    before { visit competences_path }
    it { should have_content 'Список компетенций' }
    it { should have_selector 'table.table' }
  end

  describe 'show new competences form' do
    before { visit new_competence_path }
    it { should have_button 'Create Competence' }
    it { should have_text 'Создание новой компетенции' }
    it { should have_text 'Введите название компетенции' }
  end

  describe 'create competence' do
    before do
      visit new_competence_path
      fill_in 'competence[name]', with: 'PHP5.3'
    end

    it 'by submitting form' do
      expect { click_button 'Create Competence' }.to change(Competence, :count).by(1)
    end

    describe 'and see page with created competence' do
      before { click_button 'Create Competence' }
      it { should have_text 'Создана новая компетенция' }
      it { should have_content 'Список компетенций' }
      it { should have_selector 'table.table' }
      it { should have_content 'PHP5.3' }
    end
  end
end

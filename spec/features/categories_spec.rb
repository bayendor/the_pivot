require 'rails_helper'

describe 'Category Views', type: :feature do


  describe 'when a user visits /categories' do
    before(:each) do
      category_1 = Category.create(name: 'Reptiles', description: 'description')
      category_2 = Category.create(name: 'Mammals', description: 'description')

      loan_request = LoanRequest.create(user_id: 1, title: 'title',
                                        blurb: 'blurb',
                                        description: 'description',
                                        borrowing_amount: 10,
                                        amount_funded: 0,
                                        requested_by_date: DateTime.now,
                                        payments_begin_date: DateTime.now.months_since(1),
                                        payments_end_date: DateTime.now.months_since(7),
                                        status: true, categories: [category_1])

      loan_request1 = LoanRequest.create(user_id: 2, title: 'title1',
                                         blurb: 'blurb',
                                         description: 'description1',
                                         borrowing_amount: 110,
                                         amount_funded: 10,
                                         requested_by_date: DateTime.now,
                                         payments_begin_date: DateTime.now.months_since(1),
                                         payments_end_date: DateTime.now.months_since(7),
                                         status: true, categories: [category_2])

      visit '/categories'
    end

    it 'a list of categories is displayed' do
      expect(page).to have_content('Loan Categories')
      expect(page).to have_link('Reptiles')
      expect(page).to have_link('Mammals')
    end

    it 'and the number of loans in each category is displayed' do
      expect(page).to have_content('Reptiles 1')
      expect(page).to have_content('Mammals 1')
    end
  end
end

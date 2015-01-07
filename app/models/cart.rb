class Cart
  attr_reader :session

  def initialize(session)
    @session = session
    session['cart'] ||= {}
    session['cart']['loans'] ||= {}
  end

  def loans
    session['cart']['loans']
  end

  def find_loan_request
    loans.map do |key, value|
      LoanRequest.where("id = ?", key)
    end.flatten
  end

  def add_loan(id)
    loans[id] = "0"
  end

  def add_amounts_to_loans(amounts)
    loans.each_with_index do |(key, value), index|
      loans[key] = amounts[index]
    end
  end

  def remove_loan(id)
    loans.delete(id)
  end
end

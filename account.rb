class Account
  attr_reader :account,:init_amount,:transactions
  def initialize(account,init_amount)
    @account = account
    @init_amount = init_amount.to_f
    @transactions = []
  end

  def get_amount(transaction)
    if transaction[:account] == @account
      @transactions << transaction
    end
  end

  def summary
    summary = []
    @transactions.each do |description|
      summary << description[:summary]
    end
    summary
  end

  def total_money
    final_amount = init_amount
    @transactions.each do |amount|
      final_amount += amount[:amount]
    end
    final_amount
  end

end

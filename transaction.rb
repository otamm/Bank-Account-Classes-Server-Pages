class Transaction
  def initialize(date,amount,description,account)
    @date = date
    @amount = amount.to_f
    @description = description
    @account = account
  end

  def deposit?
    if @amount > 0
      return true
    else
      return false
    end
  end

  def info
    return {amount: @amount.to_f, summary: self.summary, account: @account, date: @date.to_s}
  end

  def summary
    money = @amount.to_s
    d_or_w = ""
    if deposit?
      d_or_w = "DEPOSIT"
    else
      d_or_w = "WITHDRAWAL"
      money.slice!(0)
    end
    "#{@date} | #{d_or_w} | $ #{money} | #{@description} "
  end
end

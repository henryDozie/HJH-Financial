require_relative 'accounts'
class Transactions < Account

  def initialize

    # @history = []
  end

  def Create_account
    super
    puts "Your account has been created successfully"
  end

  def Withdraw
    super
    puts "Transaction complete"
  end

  def Deposit
    puts "Transaction complete"
  end

  def Transfer
    puts "Transaction complete"
  end

  def Show_history
    super
  end

  def pin
    super
  end

  def pin_error
    super
  end
end

me = Transactions.new
me.Create_account
me.Show_history
me.Withdraw
me.Show_history


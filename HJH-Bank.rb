class HJH
  def initialize(name)
    @name = name
  end
end
class Customer
  attr_accessor :name, :ssn, :account_number, :account_type, :address, :balance

  def initialize
    @name = name
    @ssn = ssn
    @account_number = account_number
    @account_type = account_type
    @address = address
    @balance = 0
    @pin = 1234

  end

  def open_account
    puts "What is your name:\n"
    @name = gets.chomp.to_s
    puts "Hello #{@name} What kind of account would you like to open:\n"
    puts "1: Savings\n"
    puts "2: Checking\n"

    option = gets.to_i
      if option == 1
        @account_type = 'Savings'
      elsif
        option == 2
        @account_type = "Checking"
      else
        puts pin_error
      end
  end


  def pin_error
    return "Access Denied, incorrect pin"
  end

  def display_balance
    puts "Please enter your pin: "
    pin_number = gets.to_i
    if pin_number == @pin
      puts 'Getting your account balance......'
      sleep 1
      puts "Your account balance is #{@balance}"
    else
      puts pin_error
    end
  end

  def withdraw
    puts "Please enter your pin: "
    pin_number = gets.to_i
    if pin_number == @pin
      puts "How much would you like to withdraw?: "
      amount = gets.to_i
      @balance -= amount
      puts "wait......"
      sleep 1
      puts "Withdrew #{amount}... Your new balance is #{balance}"
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number == @pin
      @balance += amount
      puts "wait......"
      sleep 1
      puts "Deposited #{amount}... Your new balance is #{balance}"
    else
      puts pin_error
    end
  end

  #   class Savings_Account < Customer
  #     # super
  #
  #     def transaction_type(type)
  #
  #     end
  #
  #     def withdrawal(amount)
  #
  #     end
  #
  #     def deposit(amount)
  #
  #     end
  #
  #     def display_balance
  #
  #     end
  #
  #     def transfer_funds
  #
  #     end
  #
  #
  #   end
  # end
  #
  # class Checking_Account < Customer
  #
  #   def initialize
  #
  #   end
  #
  #   def transaction_type(type)
  #
  #   end
  #
  #   def withdrawal(amount)
  #
  #   end
  #
  #   def deposit(amount)
  #
  #   end
  #
  #   def display_balance
  #
  #   end
  #
  #   def transfer_funds
  #
  #   end
  #
  # end
end

me = Customer.new
# p me.open_account
# p me.display_balance
# p me.deposit(1234,50000)
# p me.display_balance
# p me.withdraw
# p me.display_balance
# random = rand(10001..99999)
# puts random

time = Time.now.getutc
p time


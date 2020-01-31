class Account
  attr_accessor :name
  attr_accessor :checking_balance
  attr_accessor :savings_balance
  @@toa = Time.now.getutc.to_s

  def initialize(name, checking_balance, savings_balance, total_balance)
    @name = name
    @checking_balance = checking_balance
    @savings_balance = savings_balance
    @checking_balance + @savings_balance = total_balance
    @pin = 1234
    @history = []

  end

  def error_text
    puts 'wait .....'
    sleep 1
    puts "That was a wrong input, no such account exists.\n"
  end

  def Create_account
    puts "What is your name:\n"
    @name = gets.chomp.to_s
    puts "Hello #{@name} What kind of account would you like to open:\n"
    puts "1: Savings\n"
    puts "2: Checking\n"

    option = gets.to_i
    if option == 1
      @account_type = 'Savings'
      savings_balance = 0
      toa = Time.now.getutc.to_s
      p "Account created on #{@@toa}"
    elsif option == 2
      @account_type = "Checking"
      checking_balance = 0
      toa = Time.now.getutc.to_s
      p "Account created on #{@@toa}"
    else
      puts error_text
    end
  end

  def Display_balance
    puts "Please enter your pin: "
    pin_number = gets.to_i
    if pin_number == @pin
      puts 'Getting your account balance......'
      sleep 1
      puts "Your savings account balance is #{savings_balance} \n Your checking account balance is #{checking_balance}"
    else
      puts pin_error
    end
  end

  def Deposit
    puts 'Please enter your pin: '
    pin_number = gets.to_i
    if pin_number == @pin

      puts "Which account would you like to deposit to?\n 1- checking\n2- savings"
      choice = gets.to_i
      case choice
      when 1
        puts 'How much will you like to deposit in your checking account?'
        amount = gets.to_i
        @checking_balance += amount
        puts 'wait......'
        sleep 1
        history = "Deposited #{amount} to your checking account\n"
        @history.push(history)
        puts "Deposited #{amount} to your checking account\n Your new balance is #{@checking_balance}"
        p "Deposited at #{@@toa}"
        store_history

      when 2
        puts 'How much will you like to deposit in your savings account?'
        amount = gets.to_i
        @savings_balance += amount
        puts 'wait......'
        sleep 1
        history = "Deposited #{amount} to your savings account\n"
        @history.push(history)
        puts "Deposited #{amount} to your savings account\n Your new balance is #{@savings_balance}"
        p "Deposited at #{@@toa}"
        store_history

      else
        puts "I'm sorry, I don't recognize that account name."
      end

    else
      puts pin_error
    end
  end

  def Withdraw
    puts 'Please enter your pin: '
    pin_number = gets.to_i
    if pin_number == @pin

      puts "Which account would you like to withdraw from?\n 1- checking\n2- savings"
      choice = gets.to_i
      case choice
      when 1
        puts 'How much will you like to withdrawn from your checking account?'
        amount = gets.to_i
        @checking_balance -= amount
        puts 'wait......'
        sleep 1
        history = "Withdrew #{amount} from your checking account\n"
        # p history
        @history.push(history)
        puts "Withdrew #{amount} from your checking account\n Your new balance is #{@checking_balance}"
        p "Withdrew at #{@@toa}"
        store_history

      when 2
        puts 'How much will you like to withdraw from your savings account?'
        amount = gets.to_i
        @savings_balance -= amount
        puts 'wait......'
        sleep 1
        history = "Withdrew #{amount} from your savings account\n"
        @history.push(history)
        puts "Withdrew #{amount} to your savings account\n Your new balance is #{@savings_balance}"
        p "Withdrew at #{@@toa}"
        store_history

      else
        puts "I'm sorry, I don't recognize that account name."
      end
    else
      puts pin_error
    end
  end

  def Store_history
    File.open(File.dirname(__FILE__)+'/data/transactions.txt','w') do |line_by_line|
      @history.each do |history|
        line_by_line.puts history
      end
    end
  end

  def Show_history
    File.open(File.dirname(__FILE__)+'/data/transactions.txt','r') do |line_by_line|
      line_by_line.readlines.each { |line |
        puts line
      }
    end
  end

  def Transfer
    puts 'Please enter your pin: '
    pin_number = gets.to_i
    if pin_number != pin
      pin_error
    else
      puts 'Which account would you like to transfer from? [checking/savings]?'
      choice = gets.chomp
      puts 'How much will you like to transfer?'
      amount = gets.to_i

      case choice
      when 'checking'
        other = 'savings'
        from = @checking_balance
        to = @savings_balance
      when 'savings'
        other = 'checking'
        from = @savings_balance
        to = @checking_balance
      else
        puts "I'm sorry, I don't recognize that account name."
      end
      if amount > from
        puts "I'm sorry, you do not have sufficient funds to make this transfer at this time. Please deposit funds or choose a different transfer amount."
      else
        from -= amount
        to += amount
        puts "You transferred $#{amount} from your #{choice} account to your #{other} account.\n"
        puts "Your new #{choice} account balance is $#{from}.\n"
        puts "Your new #{other} account balance is $#{to}."
        puts 'Thank you for your transaction.'
      end
    end
  end

  private

  def pin
    @pin = 1234
  end

  def pin_error
    return 'Access denied: incorrect PIN.'
  end

end

# me = Account.new("name", 0, 0, 0)
# me.create_account
# me.deposit
# # p me.history
# me.withdraw
# me.show_history


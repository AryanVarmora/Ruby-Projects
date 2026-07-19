class BankAccount
  def initialize(name, balance)
    @name = name
    @balance = balance
    @transactions = []
  end
  def welcome
    puts "Hi #{@name}, welcome back!"
  end
  def check_balance
    puts "Your current balance is $#{@balance}."
  end
  def deposit(amount)
    if amount <= 0
      puts "Please enter a positive amount!"
      return
    end

    @balance += amount
    puts "You deposited $#{amount}."
    puts "Your current balance is $#{@balance}."
    transaction = {
      type: "Deposit",
      balance: @balance,
      amount: amount
    }

    @transactions << transaction
  end
  def withdraw(amount)
    if amount <= 0
      puts "Please enter a positive amount!"
    elsif amount > @balance
      puts "Insufficient funds!"
    else
      @balance -= amount
      puts "You withdrew $#{amount}."
      puts "Your current balance is $#{@balance}."
      transaction = {
        type: "Withdrawal",
        balance: @balance,
        amount: amount
      }
      @transactions << transaction

    end
  end
  def view_transactions
    if @transactions.empty?
      puts "No transactions yet."
    else
      @transactions.each_with_index do |transaction, index|
        puts "#{index + 1}. #{transaction[:type]}: $#{transaction[:amount]} — Balance: $#{transaction[:balance]}"
      end
    end
  end
end

puts "Please enter your name:"
name = gets.chomp
account = BankAccount.new(name, 1_000_000)
account.welcome


loop do
  puts "Please select from the menu"
  puts "1. Check balance"
  puts "2. Deposit money"
  puts "3. Withdrawal money"
  puts "4. View transactions"
  puts "5. Exit"

  menu = gets.chomp.to_i

  case menu
  when 1
    account.check_balance
  when 2
    puts "Please enter the amount you would like to deposit:"
    amount = gets.chomp.to_i
    account.deposit(amount)
  when 3
    puts "Please enter the amount you would like to withdraw:"
    amount = gets.chomp.to_i
    account.withdraw(amount)
  when 4
    account.view_transactions
  when 5
    puts "Thank you for using US bank account. Goodbye!"
    break
  else
    puts "Please enter a valid option!"
  end

end
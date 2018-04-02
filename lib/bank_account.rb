class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balacne is $#{self.balance}."
  end

  def valid?
    false if @status == "closed" || @balance <= 0
  end
end

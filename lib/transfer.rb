class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    !sender.valid? || !receiver.valid? || sender.balance < amount ? false : true
  end

  def execute_transaction
    if !self.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end

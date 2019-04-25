require 'pry'

class Transfer
  #attr_reader :sender, :receiver
  attr_accessor :status, :amount, :sender, :receiver
  # your code here
  def initialize(sender, receiver, amount = 50, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    end
  end

  def execute_transaction
    
    receiver.deposit(amount)
    sender.balance -= amount
    self.status = "complete"
    define_singleton_method(:execute_transaction) {}
    if sender.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end

require 'pry'

class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(money)
    @balance = self.balance + money
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        # binding.pry
        @balance > 0 && @status == "open" ? true : false
    end

    def close_account
        @status = "closed"
    end
end

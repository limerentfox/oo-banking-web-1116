class BankAccount
    attr_accessor :status, :balance
    attr_reader :name

    def initialize(name, balance = 1000, status = 'open')
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(num)
        self.balance += num
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        return true if status == 'open' && self.balance > 0
        false
    end

    def close_account
        self.status = 'closed'
    end
end

class Transfer
    attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount, status = 'pending')
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = status
    end

    def valid?
        return true if sender.valid? && receiver.valid?
        false
    end

    def execute_transaction
        if status == 'pending'
            receiver.deposit(amount)
            sender.deposit(amount * -1)
            self.status = 'complete'
        end

        if sender.valid? == false
            self.status = 'rejected'
            return 'Transaction rejected. Please check your account balance.'
        end
    end

    def reverse_transfer
        if status == 'complete'
            receiver.deposit(amount * -1)
            sender.deposit(amount)
            self.status = 'reversed'
        end
    end
end

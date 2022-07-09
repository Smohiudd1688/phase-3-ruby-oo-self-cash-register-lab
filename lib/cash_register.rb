class CashRegister
    attr_accessor :total, :discount, :items, :lastItem

    def initialize(discount = nil)
        @total = 0
        @items = []
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        self.lastItem = price * quantity
        while quantity != 0
            self.items.push(title)
            quantity -= 1
        end
    end

    def apply_discount
        if discount == nil
            "There is no discount to apply."
        else
            self.total = self.total - (self.total * (self.discount / 100.0))
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total -= self.lastItem
    end
end

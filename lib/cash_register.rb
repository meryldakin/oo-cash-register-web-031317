require 'pry'

class CashRegister

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transaction_list = []
  end

  attr_accessor :discount, :total


  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times do
      @items << title
    end
    quantity.times do
      @transaction_list << {title => price * quantity}
    end
  end

  def transaction_list
    @transaction_list
  end

  def apply_discount
    if @discount > 0
      self.total = @total - ((@discount/100.00) * @total)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    last_value_array = transaction_list.last.values

    @total -= last_value_array[0]



    transaction_list.pop
  end

end

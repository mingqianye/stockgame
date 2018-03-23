class Portfolio
  attr_reader :cash, :num_shares
  def initialize
    @cash = 1.0
    @num_shares = 0.0
  end

  def bought_at(price:)
    @num_shares = @cash / price
    @cash = 0.0
  end

  def sold_at(price:)
    @cash = @num_shares * price
    @num_shares = 0.0
  end

  def total(price:)
    @cash + @num_shares * price
  end
end

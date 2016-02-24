class Transaction
	attr_accessor :id, :product, :customer

	@@id_generator = 0
	@@transactions = []

	def self.all
		@@transactions
	end

	def initialize(customer, product)
		if product.in_stock? then
			@customer = customer
			@product = product
			@id = @@id_generator += 1
			product.stock -= 1
			add_to_transactions
		else 
			raise OutOfStockError, "#{product.title} is out of stock."
		end
	end

	private

	def add_to_transactions
		@@transactions << self
	end
end
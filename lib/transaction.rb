class Transaction
	attr_accessor :id, :product, :customer

	def initialize(customer, product)
		@customer = customer
		@product = product
	end
end
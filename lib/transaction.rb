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

	def self.find(id)
		all.each do |transaction|
			if transaction.id == id then
				return transaction
			else 
				"#{id} does not exist"
			end
		end
	end

	def self.return(id)
		transaction = find(id)
		all.delete(transaction)
		transaction.product.stock += 1
	end

	private

	def add_to_transactions
		@@transactions << self
	end
end
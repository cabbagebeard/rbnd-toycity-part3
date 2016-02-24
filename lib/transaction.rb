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
		all.map do |transaction|
			if transaction.id == id then
				return transaction
			end
		end
	end

	def self.return(id)
		transaction = find(id)
		all.delete(transaction)
		transaction.product.stock += 1
	end

	def self.purchases_by(customer)
		all.each do |transaction|
			if transaction.customer == customer 
				puts "Transaction ID: #{transaction.id}    Title: #{transaction.product.title}\n"
			else 
				raise NoTransactionFoundError, "No transactions found for #{customer}"
			end
		end
	end

	private

	def add_to_transactions
		@@transactions << self
	end
end
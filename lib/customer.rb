class Customer
	attr_accessor :name
	@@customers = []

	def self.all
		@@customers
	end

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def self.find_by_name(name)
		all.each do |customer|
			if customer.name == name then
				return customer
			else 
				"#{name} does not exist"
			end
		end
	end

	def purchase(product)
		if product.in_stock? then
			Transaction.new(self, product)
		else 
			raise OutOfStockError, "#{product.title} is out of stock."
		end
	end

	def return_item(id)
		Transaction.return(id)
	end

	private

	def add_to_customers
		for customer in @@customers
			if customer.name == @name
				raise DuplicateCustomerError, "#{@title} already exists."
			end
		end
		@@customers << self
	end
end
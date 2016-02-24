class Customer
	attr_accessor :name
	@@customers = []

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def self.all
		@@customers
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
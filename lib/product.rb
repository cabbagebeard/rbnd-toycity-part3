class Product
	attr_accessor :title, :price, :stock

	@@products = []
	@@in_stock = []

	def self.all
		@@products
	end
	
	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
		add_to_in_stock if @stock > 0
	end

	def self.find_by_title(title)
		all.each do |product|
			if product.title == title then
				return product
			else 
				"#{title} does not exist"
			end
		end
	end

	def in_stock?
		@stock > 0
	end

	def self.in_stock
		@@in_stock
	end

	private

	def add_to_products
		for product in @@products
			if product.title == @title
				raise DuplicateProductError, "#{@title} already exists."
			end
		end
		@@products << self
	end

	def add_to_in_stock
		@@in_stock << self
	end
end

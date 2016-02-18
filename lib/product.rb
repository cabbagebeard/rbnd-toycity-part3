class Product
	attr_accessor :title, :price, :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.find_by_title(title)
		all.each do |product|
			if product.title == title then
				return product
			else #raise NoProductError,
				"#{title} does not exist"
			end
		end
	end

	def in_stock?
		@stock > 0
	end

	private

	def add_to_products
		#if :title == title in @@products, raise DuplicateProductError
		@@products << self
	end

end
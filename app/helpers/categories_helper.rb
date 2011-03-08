module CategoriesHelper
	def get_sub_categories_by_parent_id(parent_id)
		@sub_categories = Category.find_all_by_parent_id(parent_id)
	end
end

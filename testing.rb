require 'minitest/autorun'

class MyTest < Minitest::Unit::TestCase

	def test_that_addition_works
		assert_equal 4, 2 + 2
	end

	def test_that_my_array_has_a_value
		animals = ["fish", "cat", "dog"]
		assert animals.include?("cat")
	end

	def test_assert_delta
		assert_in_delta 3.1534, 3, 0.2
	end

	def test_assert_match
		assert_match /world/, "hello world"
	end
end
```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s =~ /^get_(.+)$/
      attribute = $1
      if instance_variable_defined?("@#{attribute}")
        instance_variable_get("@#{attribute}")
      else
        raise NoMethodError, "undefined method '#{method_name}' for #<#{self.class}:0x#{self.object_id.to_s(16)}>"
      end
    else
      super
    end
  end
end

my_object = MyClass.new(10)
puts my_object.get_value # Output: 10
puts my_object.get_nonexistent # Output: NoMethodError: undefined method `get_nonexistent'
```
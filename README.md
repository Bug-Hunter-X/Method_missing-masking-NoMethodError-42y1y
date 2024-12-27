# Ruby method_missing Bug

This repository demonstrates a subtle bug related to the use of `method_missing` in Ruby.  The provided code attempts to gracefully handle missing methods using `method_missing`, but improperly handles the case where `instance_variable_defined?` is false, leading to unexpected behavior.

The issue lies in masking the underlying `NoMethodError` which can make debugging difficult.  The solution shows the correct way to handle missing methods and still preserve error handling for methods that truly are not defined.

## How to Reproduce

1. Clone the repository.
2. Run `bug.rb`. 
3. Observe the `NoMethodError` is masked when accessing `get_nonexistent`.
4. Run `bugSolution.rb`. 
5. Observe the proper `NoMethodError` is raised.

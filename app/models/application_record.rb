class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def my_class
    puts self.class
  end
end


--cmand


def call_my_class(instance)
  puts instance.my_class
end

def call_my_name(instance)
  puts instance.my_class
end

user = User.new
blog = Blog.new

call_my_class(user)
call_my_class(blog)

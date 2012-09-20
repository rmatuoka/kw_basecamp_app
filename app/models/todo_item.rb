class TodoItem < ActiveRecord::Base
  has_many :todo_lists
end

class AddTablesNullConstraint < ActiveRecord::Migration[5.2]
  def up
   change_column_null(:tests, :title, false)
   change_column_null(:questions, :body, false)
   change_column_null(:users, :first_name, false)
   change_column_null(:users, :last_name, false)
   change_column_null(:users, :email, false)
   change_column_null(:categories, :title, false)
 end

 def down
   change_column_null(:tests, :title, true)
   change_column_null(:questions, :body, true)
   change_column_null(:users, :first_name, true)
   change_column_null(:users, :last_name, true)
   change_column_null(:users, :email, true)
   change_column_null(:categories, :title, true)
 end
end

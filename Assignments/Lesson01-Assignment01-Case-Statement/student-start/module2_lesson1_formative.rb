some_var = "false"
another_var = "nil"

case 
when some_var == 'pink elephant' # fails some_var is "false" not "pink elephant"
  puts "Don't think about the pink elephant!"
when another_var.nil? # fails because another_var is a string not nil type
  puts "Question mark in the method name?"
when some_var == false # same as above
  puts "Looks like this one should execute"
else
  puts "I guess nothing matched... But why?"
end


#.....

#Finished in 0.00608 seconds (files took 0.17561 seconds to load)
#5 examples, 0 failures
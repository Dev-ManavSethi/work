class CallBack
    def self.after_destroy(object)
        puts "#{object.class} #{object.name} deleted!"
    end

    def around_save(object)
    end

#   before_create

#   around_create

#   after_create

#   after_save

#   after_commit

#   after_rollback

#   before_update

#   around_update 

#   #after_update throw :abort

#   before_destroy

#   around_destroy

#   after_destroy CallBacks

#   after_initialize

#   after_find

#   after_touch

# before_validation

#   after_validation


#Callbacks skipper functions:
  # decrement!
  # decrement_counter
  # delete
  # delete_all
  # increment!
  # increment_counter
  # update_column
  # update_columns
  # update_all
  # update_counters

end
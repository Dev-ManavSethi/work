class CallBack < ApplicationRecord
  # before_validation
  # after_validation
  #
  # before_save
  # around_save
  def after_save (object)

  end

  def before_create(object)
  end

  def around_create (object)
    puts "Going to create a #{object.class}"
    yeild
    puts "Created #{object.class}: #{object.name} "
  end

  def after_create(object)
  end

  after_commit
  after_rollback

  before_update
  around_update
  after_update

  before_destroy
  around_destroy
  after_destroy

  after_initialize

  after_find

  after_touch

  #Callbacks skipper

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

class Foo < ActiveRecord::Base
  after_find :slow_call

  private

  def slow_call
    sleep(2)
    update_attributes(name: name * 2)
  end

end

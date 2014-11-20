class Additional1Controller < ApplicationController
  def view1
  	@sum = 2+2
  	@conctat = "string"+"STRING"
  	@timein1hour = 1.hour.from_now.localtime
  	@files = Dir.glob('*')
  end
end

module SessionsCount

  def session_count(counter)
    return 0 if counter.nil?
    counter += 1
  end
end
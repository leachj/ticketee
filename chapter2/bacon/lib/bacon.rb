class Bacon
  
  def edible?
    !@expired
  end
  
  def expired!
    @expired = true
  end
end
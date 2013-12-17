class Fixnum
  def of
    (0..self-1).collect do |i|
      yield(i)
    end
  end
end

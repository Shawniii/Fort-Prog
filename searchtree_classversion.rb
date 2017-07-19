class Searchtree

  def initialize()
    @key   = nil
    @value = nil
    @left  = nil
    @right = nil
  end

  def insert!(k,v)
    if @key==k || @key == nil then
      @key   = k
      @value = v
    elsif @key > k then
      if @left==nil then
        @left = Searchtree.new
        @left.insert!(k,v)
      else
        @left.insert!(k,v)
      end
    else
      if @right==nil then
        @right = Searchtree.new
        @right.insert!(k,v)
      else
        @right.insert!(k,v)
      end
    end    
  end

  def lookup(k)
    if @key==k || @key == nil then
      return @value
    elsif @key > k then
      if @left==nil then
        return nil
      else
        @left.lookup(k)
      end
    else
      if @right==nil then
        return nil
      else
        @right.lookup(k)
      end
    end
  end

  def delete!(k)
    puts "not implemented yet. But soon!"
  end
end

st = Searchtree.new
p st
st.insert!(42,"Hallo")
p st
st.insert!(73,"Hola")

p st

st = Searchtree.new

n = 100000

for i in 0..n
  st.insert!(Random.rand(n),i.to_s)
end

puts "alle drin"

p st.lookup(n/2)






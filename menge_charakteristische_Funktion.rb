f = lambda do |x| x+1 end

puts f.call(4)

puts f.call(72)

plus = lambda do |x,y| x+y end

a = [f,plus]

puts a[1].call(42,31)

def empty_set
  return lambda do |x| false end
end

def add_elem(e,s)
  return lambda do |x| x==e || s.call(x) end
end

def union(s1,s2)
  return lambda do |x| s1.call(x) || s2.call(x) end
end

def complement(s)
  return lambda do |x| !(s.call(x)) end
end

def is_elem?(e,s)
  return s.call(e)
end

s = empty_set
for i in 0..10 do
  s = add_elem(i,s)
end

puts is_elem?(42,complement(s))
puts is_elem?(7,complement(s))


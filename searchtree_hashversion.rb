def empty_searchtree
  return {}
end

def insert!(k,v,st)
  if st=={} then
    st[:key] = k
    st[:value] = v
    st[:left] = empty_searchtree
    st[:right] = empty_searchtree
  elsif st[:key] == k then
    st[:value] = v
  elsif st[:key] > k then
    insert!(k,v,st[:left])
  else
    insert!(k,v,st[:right])
  end
  
end

def lookup(k,st)
  if st=={} then
    return nil
  elsif st[:key] == k then
    return st[:value]
  elsif st[:key] > k then
    lookup(k,st[:left])
  else
    lookup(k,st[:right])
  end
end

def delete!(k,st)
  puts "not implemented yet. But soon!"
end

st0 = {:key => 7, :value => "Hallo", 
       :left => {:key => 5, :value => "Hola",
                 :left => {} ,
                 :right => {} },
       :right => {} }

p lookup(7,st0)

p lookup(5,st0)

p lookup(9,st0)

insert!(9,"Jippy",st0)

p lookup(9,st0)

st = empty_searchtree

n = 100000

for i in 0..n
  insert!(Random.rand(n),i.to_s,st)
end

puts "alle drin"

p lookup(n/2,st)


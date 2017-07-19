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
  if st=={} then
    return nil
  elsif st[:key] == k then
    value = st[:value]
    if (st[:left] != {}) then
      tmp = st[:left]
      while (tmp[:right] != {}) do
        tmp = tmp[:right]
      end
      tmp[:right] = st[:right]
      st[:key] = st[:left][:key]
      st[:value] = st[:left][:value]
      st[:right] = st[:left][:right]
      st[:left] = st[:left][:left]
    else
      st[:key] = st[:right][:key]
      st[:value] = st[:right][:value]
      st[:left] = st[:right][:left]
      st[:right] = st[:right][:right]
    end
    return value
  elsif st[:key] > k then
    delete!(k, st[:left])
  else
    delete!(k, st[:right])
  end
end

st0 = {:key => 7, :value => "Hallo", 
       :left => {:key => 5, :value => "Hola",
                 :left => {} ,
                 :right => {} },
       :right => {} }

st1 = {:key => 7, :value => "Hallo", 
       :left => {:key => 5, :value => "Hola",
                 :left => {} ,
                 :right => {:key => 6, :value => "Bla",
                            :left => {},
                            :right => {}} },
       :right => {:key => 8, :value => "Welt",
                  :left => {},
                  :right => {}} }

delete!(7,st1)
p st1


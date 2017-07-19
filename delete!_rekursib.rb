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

def add_tree_to_rightest_child!(t1,t2)
  if t1[:right]=={} then
    t1[:right]= t2
  else
    add_tree_to_rightest_child!(t1[:right],t2)
  end
end

def shift_child_to_parent!(direction,st)
  st[:key]= st[direction][:key]
  st[:value]= st[direction][:value]
  new_left = st[direction][:left]
  new_right = st[direction][:right]
  st[:left]= new_left
  st[:right]= new_right
end

def delete!(k,st)
  if st=={} then
    return nil
  elsif st[:key] == k then
    value = st[:value]
    if st[:left]=={} then
      shift_child_to_parent(:right,st)
    else
      add_tree_to_rightest_child!(st[:left],st[:right])
      p st[:left]
      #st=st[:left]  geht nicht, da der Hash in st so nicht verändert wird.
      shift_child_to_parent!(:left,st)
    end
    return value
  elsif st[:key] > k then
    delete!(k,st[:left])
  else
    delete!(k,st[:right])
  end
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

st = empty_searchtree
[2,17,13,22,10,11,14,48,42,77].each_with_index {|x,i| insert!(x,i,st) }

p st

p delete!(17,st)

p st


{:key=>2, :value=>0,
 :left=>{}, 
 :right=>{:key=>17, :value=>1,
          :left=>{:key=>13, :value=>2, 
                  :left=>{:key=>10, :value=>4,
                          :left=>{}, 
                          :right=>{:key=>11, :value=>5,
                                   :left=>{}, 
                                   :right=>{}}}, 
                  :right=>{:key=>14, :value=>6,
                           :left=>{},
                           :right=>{}}}, 
          :right=>{:key=>22, :value=>3,
                   :left=>{},
                   :right=>{:key=>48, :value=>7,
                            :left=>{:key=>42, :value=>8,
                                    :left=>{},
                                    :right=>{}},
                           :right=>{:key=>77, :value=>9,
                                    :left=>{},
                                    :right=>{}}}}}}

{:key=>2, :value=>0,
 :left=>{},
 :right=>{:key=>13, :value=>2,
          :left=>{:key=>10, :value=>4,
                  :left=>{},
                  :right=>{:key=>11, :value=>5,
                           :left=>{},
                           :right=>{}}}, 
          :right=>{:key=>11, :value=>5,
                   :left=>{},
                   :right=>{}}}}















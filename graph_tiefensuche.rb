# ADT Pair
def pair(a,b)
  return [a,b]
end

def fst(pair)
  return pair[0]
end

def snd(pair)
  return pair[1]
end

# ADT graph

def empty_graph
  return []
end

def add_node!(g,l)
  g << pair(l,[])
  return g.size-1
end

def add_edge!(g,n1,l,n2)
  snd(g[n1]) << pair(l,n2)
  snd(g[n2]) << pair(l,n1)
end

def graph_size(g)
  return g.size
end

def neighbours(g,n)
  return snd(g[n])
end

g = empty_graph
nodes = [0,1,2,3,4,5,6].map! { |x| add_node!(g,(x+65).chr) }


add_edge!(g,nodes[0], 7,nodes[1])
add_edge!(g,nodes[1],12,nodes[2])
add_edge!(g,nodes[1],22,nodes[4])
add_edge!(g,nodes[2],23,nodes[3])
add_edge!(g,nodes[3],17,nodes[4])
add_edge!(g,nodes[4],11,nodes[6])
add_edge!(g,nodes[4],10,nodes[5])
add_edge!(g,nodes[5],15,nodes[6])

p g

def depth_first_search(g,n,marken)
  if marken[n] then
    return []
  else
    marken[n]=true
    neighbours = neighbours(g,n).map { |labled_succ| snd labled_succ }
    dfs_path = []
    neighbours.each do |node|
      dfs_path = dfs_path + depth_first_search(g,node,marken)
    end
    return [n]+dfs_path
  end
end


p depth_first_search(g,nodes[0],{})



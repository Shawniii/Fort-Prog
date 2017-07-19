require "csv.rb"

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

def lookup_node(g,label)
  index = nil
  g.each_with_index { |labeled_node,i| if fst(labeled_node) == label then
                                         index = i
                                       end }
  return index 
end

def update_node!(g,label)
  index = nil
  g.each_with_index { |labeled_node,i| if fst(labeled_node) == label then
                                         index = i
                                       end }
  if index == nil then
    index = add_node!(g,label)
  end
  return index 
end

def add_edge_by_label!(g,l1,el,l2)
  n1 = update_node!(g,l1)
  n2 = update_node!(g,l2)
  add_edge!(g,n1,el,n2)
end

def graph_size(g)
  return g.size
end

def neighbours(g,n)
  return snd(g[n])
end

def read_from_csv(file)
  g = empty_graph  
  CSV.foreach(file) { |row| add_edge_by_label!(g,row[0],
                                                 row[1].to_i,
                                                 row[2])
                    }    
  return g                    
end

g = read_from_csv("sh-map.csv") 

p g

def extract_min_node!(dist_list)
  min_dist = Float::INFINITY
  min_node = nil
  dist_list.each { |node,dist| if dist!= nil && dist<min_dist then
                                 min_dist = dist
                                 min_node = node
                               end
                            }
  dist_list[min_node]= nil
  return pair(min_node,min_dist)
end

def shortest_path(from, to, g)
  dist = 0
  visited = {}
  to_do = {}
  while from != to do
    visited[from] = true
    succs = neighbours(g,from)
    succs.each {|edge| 
                  node = snd(edge)
                  local_dist = fst(edge)
                  if !visited[node] &&
                     (to_do[node] == nil || to_do[node] > dist+local_dist)
                  then
                    to_do[node]= dist + local_dist 
                  end
               }
    next_pair = extract_min_node!(to_do)
    from = fst(next_pair)
    dist = snd(next_pair)
  end
  return dist
end

print "Von wo möchtest du starten? "
from_str = gets.chop

print "Wo hin möchtest du fahren? "
to_str = gets.chop

from = lookup_node(g,from_str)
to = lookup_node(g,to_str)

dist = shortest_path(from,to,g)
puts("Die kürzeste Strecke von "+from_str+" nach "+to_str+" ist "+
     dist.to_s+" km lang.")



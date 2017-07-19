def empty_queue
  end_elem = {}
  return {:head => end_elem,
          :end  => end_elem}
end

def enqueue!(q,v)
  end_elem = {}
  q[:end][:value] = v
  q[:end][:next] = end_elem
  q[:end] = end_elem
  return q # nicht nötig, da mutierend
end

def dequeue!(q)
  h = q[:head][:value]
  q[:head]= q[:head][:next]
  return h
end

s = empty_queue

enqueue!(s,42)
enqueue!(s,43)
enqueue!(s,42)
enqueue!(s,43)
p s

puts dequeue!(s)
puts dequeue!(s)
puts dequeue!(s)
puts dequeue!(s)

p s


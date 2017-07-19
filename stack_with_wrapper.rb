def empty_stack
  return {:stack => {}}
end

def push!(s,v)
  s[:stack] = {:value => v, :next => s[:stack]}
  return s # nicht nötig, da mutierend
end

def pop!(s)
  h = s[:stack][:value]
  s[:stack]= s[:stack][:next]
  return h
end

s = empty_stack

a = [42]

push!(s,a)
push!(s,[43])
p s

a[0]=73 #(*)

puts pop!(s)
puts pop!(s)

p s


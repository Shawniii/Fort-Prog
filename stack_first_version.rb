def empty_stack
  return {}
end

def push!(s,v)
  h = s.clone   # wird hier der ganze Stack kopiert? Nein, siehe (*)
  s[:value] = v
  s[:next] = h
  return s # nicht nötig, da mutierend
end

def pop!(s)
  h = s[:value]
  s[:value] = s[:next][:value]
  s[:next] = s[:next][:next]
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


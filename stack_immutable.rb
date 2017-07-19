def empty_stack
  return {}
end

def push(s,v)
  return {:value => v, :next => s} # einfach, weil immutable
end

def top(s)
  return s[:value]
end

def pop(s)
  return s[:next]
end

# wichtig: Zugriff definitiv nur über Schnitstelle!

s = empty_stack

s1 = push(s,42)
s2 = push(s,43)
p s1
p s2

s2 = push s2,73

puts top(s2)
s2 = pop s2
puts top(s2)
s2 = pop s2

p s2

puts top s1


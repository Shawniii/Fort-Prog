def rev(a)
  if a.size<2 then
    b = a
  else
    b = []
    for i in 0..a.size-1 do
      b = [a[i]]+b
    end
  end
  return b
end

p rev([0])
p rev([1,2])
p rev([])
p rev([1,2,3])

a = [1]

b = rev a

a.[]=(0,42)

p a

p b



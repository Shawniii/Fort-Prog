def min_pos(a,from)
  min_pos = from
  for i in from+1..a.size-1
    if a[i] < a[min_pos] then
      min_pos = i
    end
  end
  return min_pos
end

def swap!(a,i,j)
  help = a[i]
  a[i] = a[j]
  a[j] = help
end

def selection_sort(a)
  b = a.clone

  for i in 0..b.size-2 do
    min = min_pos(b,i)
    swap!(b,min,i)
  end
  return b
end

def random_array(n)
  a = Array.new(n)
  a.map {|x| Random.rand(n) }
end

#p selection_sort([])
#p selection_sort(["Hallo","Zahnpasta","Leute","Studis"])
#p selection_sort([3,6,9,-4,2,-3,1,9,5])
#a = random_array(6000)
a = Array.new(6000)
for i in 0..a.size-1 do
  a[i] = a.size-i
end

b = selection_sort(a)



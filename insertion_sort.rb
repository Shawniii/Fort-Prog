def swap!(a,i,j)
  help = a[i]
  a[i] = a[j]
  a[j] = help
end

def insertion_sort!(a)
  for i in 0..a.size-1 do
    j = i
    elem = a[i]
    while j > 0 && a[j-1] > elem do
      #swap!(a,j-1,j);
      a[j] = a[j-1]
      j = j - 1
    end 
    a[j] = elem
  end
  return a
end


def random_array(n)
  a = Array.new(n)
  a.map {|x| Random.rand(n) }
end

#p insertion_sort!([])
#p insertion_sort!(["Hallo","Zahnpasta","Leute","Studis"])
p insertion_sort!([3,6,9,-4,2,-3,1,9,5])
#a = random_array(6000)
a = Array.new(6000)
for i in 0..a.size-1 do
  a[i] = a.size-i
end
b = insertion_sort!(a)



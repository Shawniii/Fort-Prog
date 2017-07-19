def swap!(a,i,j)
  help = a[i]
  a[i] = a[j]
  a[j] = help
end

def q_sort!(a,l,r)
  swap!(a,l,l+rand(r-l))
  if l>=r then
    return a
  else
    m = l
    for i in l+1 .. r do
      if a[i] < a[m] then
        help = a [i]
        a[i] = a[m+1]
        a[m+1] = a[m]
        a[m] = help
        m = m + 1
      end
    end
    q_sort!(a,l,m-1)
    q_sort!(a,m+1,r)
  end
end

def quick_sort!(a)
  q_sort!(a,0,a.size-1)
end

def random_array(n)
  a = Array.new(n)
  a.map {|x| Random.rand(n) }
end

#a = [5,1,3,8,7,6,2,9,4]
#a = random_array(10000)
a = Array.new(10000000)
for i in 0..a.size-1 do
  a[i] = i
end

quick_sort!(a)


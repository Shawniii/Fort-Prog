def print_queens(queens)
  queens.each { |q| puts " . "*q + " Q " + " . "*(7-q)}
end

print_queens [2,0,3,1]

def complete?(queens)
  return queens.size == 8
end

def safe?(queens)
  safe = true
  for i in 0..queens.size-1 do
    q_i = queens[i]
    for j in (i+1)..queens.size-1 do
      q_j = queens[j]
      vertical = q_i == q_j
      diagonal = (q_i-q_j).abs == j-i
      if vertical || diagonal then
        safe = false
      end
    end
  end
  return safe
end

puts safe?([2,0,3,1])
puts safe?([2,1,3])

def place_next(queens)
  nums = [0,1,2,3,4,5,6,7]
  return (nums.map { |n| queens + [n] })
end

p place_next([1,3])

def solvable?(queens)
  if complete?(queens) then
    if safe?(queens) then
      print_queens(queens)
      p queens
    end
    return safe?(queens)
  end
  next_queens = place_next(queens)
  index = 0
  solvable = false
  while !solvable && index < next_queens.size do
    if safe?(next_queens[index]) then
      solvable = solvable?(next_queens[index])
    end
    index = index + 1
  end
  return solvable
end

puts solvable?([])

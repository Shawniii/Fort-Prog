def countif(arr, values)
    result = []
    pos = 0
    for i in values do
        counter = 0
        for j in arr do
            if j == i then
               counter = counter + 1 
            end
        end
        result[pos] = counter
        pos = pos + 1
    end
    return result
end

def print_counts(arr, values)
    result = countif(arr, values)
    pos = 0
    for value in values do
        # Dies ist String-Interpolation: Dadurch können Variablen in Strings "eingebaut" werden
        p("#{value}: #{result[pos]}")
        pos = pos + 1
    end
end



print_counts([1, 3, 6, 2, 5, 3, 1, 1, 1, 42], [1, 42, 83])

# output: 
# 1: 4
# 42: 1 
# 83: 0
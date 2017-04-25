def concat(a2d) 
    result = [] 
    for arr in a2d
        for i in arr do
            result.push(i)
        end
    end
    return result
end

print(concat([[2,3], [5,6], [9,10]]))
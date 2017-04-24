require 'csv'

#Sortiert ein zweidimensionales Array mit dem Inserstionsort Algorithmus
def insertion_sort_table!(table, k)
    for i in 0..table.size-1 do    
        j=i
        while j>0 && table[j-1][k]>table[j][k]do 
            swap!(table,j-1,j)
            j=j-1
        end
    end
    return table
end

# Vertauscht in a die Elemente a[i] und a[j]
def swap!(a, i, j)
  temp = a[i]
  a[i] = a[j]
  a[j] = temp
end

#Ausführungsprogramm
arr= CSV.read('students.csv')
insertion_sort_table!(arr, 2)
p(arr)
puts( "..................................")
insertion_sort_table!(arr, 0)
p(arr)
#Sortiert ein Array mit dem verbesserten Inserstionsort Algorithmus
def ins_sort!(a)
    for i in 0..a.size-1 do    
        j=i
        x=a[i]
        while j>0 && x < a[j-1] do 
            a[j]=a[j-1]
            j=j-1
        end
        a[j]=x
    end
    return a
end

#Ausführungsprogramm
arr= [2,5,7,4,1,3,10]
ins_sort!(arr)
p(arr)
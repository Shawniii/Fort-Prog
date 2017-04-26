#Sortiert ein zweidimensionales Array nach der Spalte k mit dem Quicksort-Algorithmus
def quick_sort_table!(table, k, start, ending)
    if start>=ending then
        return table     #Beendet wenn das Pivot-Element am Ende ist
    else
         counter=start  #Zählt hoch wo das Element am Ende stehen muss und womit getauscht wird
         for i in (start+1)..ending do
             if table[start][k]>table[i][k] then
                 counter=counter+1
                 swap!(table, counter, i)   #Tauscht die Elemente, die kleiner sind vor das Pivot-Element
                end
            end
            swap!(table, counter, start)   #Setzt das Pivot-Element an die richtige Stelle
            quick_sort_table!(table, k, counter+1, ending)
            quick_sort_table!(table, k, start, counter-1)
        end
end
        
# Vertauscht in a die Elemente a[i] und a[j]
def swap!(a, i, j)
  temp = a[i]
  a[i] = a[j]
  a[j] = temp
end

#Ausführungsprogramm
arr= [[1,3],[3,4],[1,2],[5,7],[3,3]]
quick_sort_table!(arr, 1, 0, arr.size-1)
p(arr)

    


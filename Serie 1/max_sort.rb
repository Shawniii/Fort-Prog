# Vertauscht in a die Elemente a[i] und a[j]
def swap!(a, i, j)
  temp = a[i]
  a[i] = a[j]
  a[j] = temp
end

# Liefert den Index des größten Elements in a von a[0] bis a[pos]
def max_pos_until(a, pos)
  # a[pos] ist für den Anfang unser größtes Element
  max_pos = pos

  # In a[0] bis a[pos-1] nach einem größeren Element suchen und
  # dessen Index merken
  for i in 0 .. pos-1 do
    if a[i] > a[max_pos] then
      max_pos = i
    end
  end
  
  # Index des größten Elements zurückliefern
  return max_pos
end

# Sortiert ein Array mit dem MaxSort-Algorithmus.
def max_sort!(a)
  # Durchlaufe das Array von hinten (a.size - i ist dann immer das
  # aktuelle Element)
  for i in 1 .. a.size-1 do
    # Suche das größte Element zwischen Index 0 und unserem aktuellen Element
    max_pos = max_pos_until(a, a.size - i)
    
    # Tausche das größte Element an unsere aktuelle Stelle
    swap!(a, a.size - i, max_pos)
  end
end


# Beispielprogramm
array = [5, 1, 3, 6, 4, 2];

p(array);  # Array VOR der Sortierung ausgeben
max_sort!(array);
p(array);  # Array NACH der Sortierung ausgeben

class QuickSort
   # Quick sort has average case time complexity O(nlogn), but worst
   # case O(n**2).

   # Not in-place. Uses O(n) memory.
   def self.sort1(array)
     if (array.count <= 1)
       return array;
     end
     pivot = array.first
     left = []
     right = []
     (1..(array.length-1)).each do |idx|
       element = array[idx]
       if element <= pivot
         left << element
       else
         right << element
       end
     end
     self.sort1(left) + [pivot] + self.sort1(right)
   end


  # In-place. You don't create any new arrays.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2}

    return array if length <=1

    pivot_idx = partition(array, start, length, &prc)

    left_size = pivot_idx - start     #take the left side size
    right_size = length - (left_size + 1)   #take the right side size
    sort2!(array, start, left_size, &prc)  #Recursively sort the left side
    sort2!(array, pivot_idx + 1, right_size, &prc)  #Recursively sort the right side

    array
  end

  #you put one element, the pivot, in its rightful place. You return that pivot's end position
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2}

    pivot = array[start]   #the pivot is the partition barrier. Everything to left is smaller, everything to right is bigger.
    pivot_idx = start

    ((start+1)...(start + length)).each do |idx|
      val = array[idx]
      if prc.call(pivot, val) < 1
        #pivot is smaller than the value
      else
        #pivot is greater than the value.

        #every time you make a swap the pivot with a smaller element, the smaller
        #element needs to go to the left of the pivot. The order of elements on the right hand
        #side don't matter, same goes for the left hand side.


        array[idx] = array[pivot_idx + 1] #move the element in the immediate right of the pivot to the current index's place
        array[pivot_idx + 1] = pivot #move the pivot up one space.
        array[pivot_idx] = val  #move the smaller value to the immediate left of the pivot
        pivot_idx +=1
      end
    end
    pivot_idx
  end
end

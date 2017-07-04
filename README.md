# Quicksort

I implemented my own Quicksort algorithm in Ruby. Quicksort takes O(n * log n) on average and
O(n^2) in the worst case scenario. For space complexity, it takes O(n) space, so I improved
it to O(log n) space by partitioning my array.

## Partitioning

Instead of creating separate arrays for items smaller than the pivot and larger than the pivot,
I partitioned each element. If an element was larger than the pivot, it would stay on the right
hand side of the pivot. If an element was smaller than the pivot, it would move to the left hand side
of the pivot. This was done via simple array index swapping:


```ruby
  val = array[idx] #current element you're comparing against
  if ((pivot <=> val) < 1)
    #pivot is smaller than the value
  else
    #pivot is greater than the value

    array[idx] = array[pivot_idx + 1] #move the element in the immediate right of the pivot to the current index's place
    array[pivot_idx + 1] = pivot #move the pivot up one space.
    array[pivot_idx] = val  #move the smaller value to the immediate left of the pivot
    pivot_idx +=1
  end
```

Next, I recursively sorted the left hand side and the right hand side, which would give me my final array. 

```ruby
sort2!(array, start, left_length, &prc)  
sort2!(array, pivot_idx + 1, right_length, &prc)  

array
```

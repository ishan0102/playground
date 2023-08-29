import random

def quicksort(arr, low, high):
    if low >= high:
        return
    pivot_index = partition(arr, low, high)
    quicksort(arr, low, pivot_index - 1)
    quicksort(arr, pivot_index + 1, high)

def partition(arr, low, high):
    # Select a random pivot_index between low and high
    pivot_index = random.randint(low, high)
    pivot_value = arr[pivot_index]

    # Move the pivot element to the end
    arr[pivot_index], arr[high] = arr[high], arr[pivot_index]

    # Initialize the lesser elements index
    lesser_items_boundary = low

    for i in range(low, high):
        if arr[i] < pivot_value:
            # Swap arr[i] and the boundary element
            arr[i], arr[lesser_items_boundary] = arr[lesser_items_boundary], arr[i]
            lesser_items_boundary += 1

    # Move pivot to its final position
    arr[high], arr[lesser_items_boundary] = arr[lesser_items_boundary], arr[high]

    return lesser_items_boundary

arr = [5, 4, 3, 2, 1]
N = len(arr)
quicksort(arr, 0, N - 1)
print(arr)

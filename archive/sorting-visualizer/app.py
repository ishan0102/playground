from algorithms import bubble, insertion, selection, bubble_vis, insertion_vis, selection_vis
import random
import os

def get_vis():
    input_vis = input("\nDo you want to visualize your sort? ").lower()
    while input_vis != "yes" and input_vis != "no" and input_vis != "y" and input_vis != "n":
        input_vis = input("Please enter yes or no: ").lower()
    if input_vis == "yes" or input_vis == "y":
        input_vis = True
    else:
        input_vis = False
    return input_vis

def user_list(input_sort):
    print("\nLet's add numbers to your list!")
    print("Type a number and press enter to add it to the list. When you're done, type \"done\".\n")
    nums = []
    num = input().lower()
    while num != "done":
        try:
            nums.append(int(num))
            print(nums)
        except:
            num = input("Please enter a valid number! ").lower()
        else:
            num = input().lower()
    
    input_vis = get_vis()
    if input_vis:
        if input_sort == "b":
            nums = bubble_vis(nums)
        elif input_sort == "i":
            nums = insertion_vis(nums)
        else:
            nums = selection_vis(nums)
    else:
        if input_sort == "b":
            nums = bubble(nums)
        elif input_sort == "i":
            nums = insertion(nums)
        else:
            nums = selection(nums)

    print("\nHere is the sorted array!")
    print(nums)

def random_list(input_sort):
    input_size = input("\nHow many numbers do you want in your list? ")
    while type(input_size) is not int:
        try:
            input_size = int(input_size)
        except:   
            input_size = input("Please enter a valid number! ")
    input_vis = get_vis()

    randomlist = []
    for i in range(input_size):
        n = random.randint(1, 51)
        randomlist.append(n)
    
    if input_vis:
        if input_sort == "b":
            nums = bubble_vis(randomlist)
        elif input_sort == "i":
            nums = insertion_vis(randomlist)
        else:
            nums = selection_vis(randomlist)
    else:
        if input_sort == "b":
            nums = bubble(randomlist)
        elif input_sort == "i":
            nums = insertion(randomlist)
        else:
            nums = selection(randomlist)

    print("\nHere is the sorted array!")
    print(nums)

def get_inputs():
    print("\nWould you like to add your own numbers or random ones?")
    input_nums = input("Type A for your own or B for random: ").lower()
    while input_nums != "a" and input_nums != "b":
        input_nums = input("Please select with A or B: ").lower()
    
    print("\nWhat kind of sort do you want to do?")
    input_sort = input("Type B for Bubble, I for Insertion, and S for Selection: ").lower()
    while input_sort != "b" and input_sort != "i" and input_sort != "s":
        input_sort = input("Please select with B, I, or S: ").lower()

    return input_nums, input_sort

def run():
    input_nums, input_sort = get_inputs()
    
    if input_nums == "a":
        user_list(input_sort)
    else:
        random_list(input_sort)

    input_restart = input("\nWould you like to sort another list? ").lower()
    while input_restart != "yes" and input_restart != "no" and input_restart != "y" and input_restart != "n":
        input_restart = input("Please enter yes or no: ").lower()
    if input_restart == "no" or input_restart == "n":
        print("\nGoodbye!\n")
    else:
        os.system('clear')
        run()

if __name__ == "__main__":
    print("\nLet's sort a list!")
    run()
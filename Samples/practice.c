#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

// if i didnt want a pointer i could also do: int arr[]
int smallest(int* lol, int size)
{
    int smallest = lol[0];

    for(size_t i = 1; i < size; i++)
    {
        if(lol[i] < smallest)
        {
            smallest = lol[i];
        }
    }
    return smallest;
}

void printArray(int* myArray, size_t size)
{
    for(size_t i = 0; i < size; i++)
    {
        printf("%d ", myArray[i]);
    }
}

int average(int* lol, int size)
{
    int total = 0;

    for(size_t i = 0; i < size; i++)
    {
        total += lol[i];
    }

    return total/size;
}

int biggest(int* lol, int size)
{
    int biggest = lol[0];

    for(size_t i = 1; i < size; i++)
    {
        if(lol[i] > biggest)
        {
            biggest = lol[i];
        }
    }

    return biggest;
}

void twoSums(int* tableau, int size, int goal)
{
    for(int i = 0; i < size; i++)
    {
        for(int j = i+1; j < size; j++)
        {
            if((tableau[i] + tableau[j]) == (goal))
            {
                // once we found the number we can break.
                printf("The two numbers that make the sum %d are: %d and %d\n",
                        goal, tableau[i], tableau[j]);
                return;
            }
        }
    }
}

void iterateString(char* myString)
{
    for(size_t i = 0; i < strlen(myString); i++)
    {
        printf("%c", myString[i]);
    }
    printf(" --> Length of string: %lu\n", strlen(myString));
}

// Returns true if myString is bigger or equal than the size.
bool isStrBigger(char* myString, size_t size)
{
    if(strlen(myString) >= size)
    {
        /* printf("It's true\n"); */
        return true;
    }
    /* printf("It's false\n"); */
    return false;
}

// Insert an element num at position pos in the tableau array that has size size.
void addToArray(int* tableau, int size, int pos, int num)
{
    // we make the array +1 in size (not actually +1 in real memory size,
    // we just shift everything to the right from the end of the array until
    // our position...)
    for(int i = size-1; i >= pos; i--)
    {
        tableau[i+1] = tableau[i];
    }

    tableau[pos] = num;
}

// 15 == fizzbuzz, 5 == fizz, 3 == buzz.
void fizzBuzz(int num)
{
    for(int i = 1; i <= num; i++)
    {
        if((i % 5 == 0) && (i % 3 == 0))
        {
            printf("%d FizzBuzz\n", i);
        }
        else if(i % 5 == 0)
        {
            printf("%d Fizz\n", i);
        }
        else if(i % 3 == 0)
        {
            printf("%d Buzz\n", i);
        }
    }
}

// Return the length of the longest sub palindrome from the input string.
int longestPalindrome(char* myString)
{
    size_t size = strlen(myString); // size of the string.

    // incase the string is empty.
    if(size == 0)
    {
        return 0;
    }

    int maxLength = 1; // if the string isnt empty 1 is minimum.

    // i is always the beginning of the current substring, j is the end
    for (int i = 0; i < size; i++) {
        for (int j = i; j < size; j++) {
            int flag = 1;

            // Check palindrome (could of used the isPalindrome function).
            for (int k = 0; k < (j - i + 1) / 2; k++)
            {
                if (myString[i + k] != myString[j - k])
                {
                    flag = 0;
                }

                // Palindrome
                if (flag && (j - i + 1) > maxLength) {
                    maxLength = j - i + 1;
                }
            }
        }
    }

    printf("max length of palindrome substring: %d\n", maxLength);
    return maxLength;
}

// returns if it's a palindrome or not.
// to check if its a palindrome, we compare it to the reverse
bool isPalindrome(char* myString)
{
    const size_t length = strlen(myString);

    // abcefg
    for(size_t i = 0; i < length/2; i++)
    {
        if(myString[i] != myString[length-1 - i])
        {
            /* printf("false!\n"); */
            return false;
        }
    }

    /* printf("true!\n"); */
    return true;
}

// outputs the maximum number of characters that follow eachother.
// ex: aaabdcdfdeaf would be 3 because aaa are same characters.
int followingChars(char* myString)
{
    int max = 1; // max is 1 for any string bigger than 0.
    size_t size = strlen(myString);
    int count = 1;

    for(size_t i = 1; i < size; i++)
    {
        if(myString[i] == myString[i-1])
        {
            count+=1;
            if (count > max)
            {
                max = count;
            }
        }
        else
        {
            count = 1;
        }

    }

    return max;
}

void reverseArray(int* myArray, size_t size)
{
    // only have to iterate through half the array.
    for(size_t i = 0; i < size/2; i++)
    {
        //swap between positions
        int holder = myArray[i];
        myArray[i] = myArray[size-1 - i];
        myArray[size-1 - i] = holder;
    }
}

// recursive solution to hanoi towers.
void hanoi(int n, char from, char to, char other)
{
    if(n == 1)
    {
        /* printf("Moving from: %c to: %c\n", from, to); */
        return;
    }

    hanoi(n-1, from, other, to);
    hanoi(n-1, other, to, from);
}

void reverseString(char* myString)
{
    size_t length = strlen(myString);

    for(size_t i = 0; i < length/2; i++)
    {
        char holder = myString[i];
        myString[i] = myString[length-1 - i];
        myString[length-1 - i] = holder;
    }
}

int longestSubstring(char* myString)
{
    size_t length = strlen(myString);

    int longest = 1; //as long as myString > 0
    int current_count = 1; //as long as myString > 0

    for(size_t i = 1; i < length; i++)
    {
        // abcdeeef
        if(myString[i] == myString[i-1])
        {
            current_count++;
        }
        else
        {
            current_count = 1;
        }

        if(current_count > longest)
        {
            longest = current_count;
        }
    }

    return longest;
}

void mergeArrays(int* a1, int* a2, int* a3, int size)
{
    for(int i = 0; i < size; i++)
    {
        a3[i] = a1[i];
    }

    int halfway = size;
    for(int i = 0; i < size; i++)
    {
        a3[halfway + i] = a2[i];
    }
}

// same as addToArray()
void insertArray(int* myArray, int size, int num, int pos)
{
    //1 2 3 4 5 6 -> 1 2 3 X 4 5 6

    for(int i = size; i >= pos; i--)
    {
        myArray[i] = myArray[i-1];
    }

    myArray[pos] = num;
}

int longestFollowingSub(char* myString)
{
    int longest = 1;
    int current_count = 1;
    int length = strlen(myString);

    // a b c d e f g
    for(int i = 0; i < length-1; i++)
    {
        if(myString[i] == myString[i+1])
        {
            ++current_count;
        }
        else
        {
            current_count = 1;
        }

        if(current_count > longest)
        {
            longest = current_count;
        }
    }

    return longest;
}

int longestDifferentSubstr(char* myString)
{
    int longest = 1;
    int current_longest = 1;

    for(int i = 1; i < strlen(myString); i++)
    {
        if(myString[i] != myString[i-1])
        {
            ++current_longest;
        }
        else
        {
            current_longest = 0;
        }

        if(current_longest > longest)
        {
            longest = current_longest;
        }
    }
    return longest;
}

// given an array, find the contiguous subarray which has
// the greatest sum and return that sum.
int maxSubArray(int* myArray, int size)
{
    int maximum = 0;
    int current = 0;
    // 1 3 -50 5 25 2  kadane algo. very simple.
    for(int i = 0; i < size; i++)
    {
        int value = myArray[i];
        if(value + current > current)
        {
            current = value + current;
        }
        else
        {
            current = value;
        }

        if(current > maximum)
        {
            maximum = current;
        }
    }
    return maximum;
}

// *********************** //
// 128 64 32 16 8 4 2 1   0x -> 8 4 2 1
// 0x6B  -> 0110 1011  -> 107
// 56    -> 0b00111000 -> 0x38


// *********************** //
// Linked List
typedef struct Node Node;
struct Node {
    int data;
    Node* next;
};

void printList(Node* node)
{
    while(node != NULL)
    {
        printf("%d\n", node->data);
        node = node->next;
    }
}

// 1->2->3->NULL =>> 3->2->1->NULL
void reverseLinkedList(Node* head)
{
    Node* previous = NULL;
    Node* current = head;
    Node* next = NULL;

    while(current != NULL)
    {
        //store the next
        next = current->next;

        // reverse the current's pointer.
        current->next = previous;

        //swapping them
        previous = current;

        //next iteration.
        current = next;
    }
    head = previous;
}


// 0 1 1 2 3 5 8 13 21 34
int fib(int n)
{
    if(n == 0)
    {
        return 0;
    }
    if(n == 1)
    {
        return 1;
    }

    return fib(n-1) + fib(n-2);
}

int main()
{
    Node* head = NULL;
    Node* second = NULL;
    Node* tail = NULL;
    head   = (Node*) malloc(sizeof(Node));
    second = (Node*) malloc(sizeof(Node));

    head->data = 5;
    head->next = second;
    second->data = 12;
    second->next = tail;


    int lol[20] = {2,2,66,1,6,25,77,88,144,4,2,1,124,6,7,7};
    int size = sizeof(lol) / sizeof(lol[0]);
    printf("average : %d\n", average(lol, size));
    printf("smallest: %d\n", smallest(lol, size));
    printf("biggest : %d\n", biggest(lol, size));
    char str[] = "chienSale"; //9chars, strlen() will return 9
    int a1[4] = {1,2,3,4};
    int a2[4] = {5,6,7,8};
    int a3[8];
    int ok[9] = {5,4,-1,7,8};
    char rofl[] = "abccd";

    twoSums(lol, size, 7);
    iterateString(str);
    followingChars(str);
    isStrBigger(str, 10);
    addToArray(lol, size, 4, 0);
    /* fizzBuzz(100); */
    longestPalindrome("roflkayakasdx");
    isPalindrome("kayak");
    printf("following chars: %d\n",followingChars("aaaabcccccccdefghi"));

    reverseArray(lol, 20); // not actually new, its a reference.

    hanoi(4, 'A', 'C', 'B');

    reverseString(rofl);
    longestSubstring(rofl);
    mergeArrays(a1,a2,a3,4);
    insertArray(lol, 20, 4, 4);
    maxSubArray(ok,9);
    longestDifferentSubstr("abcdeeef");
    return 0;
}

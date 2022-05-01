// a value can only have one owner (and its a variable).
// the value is dropped when the owner goes out of scope.
// it can be borrowed any amount of time if its not mutable.
// can only have one mutable borrow at a time.

// async/await -> For I/O bound tasks. When waiting for a response
// or user input, switch to a different task so cpu isn't idle. Needs
// a runtime (like tokio).
//
// Threads -> For CPU bound tasks. Separate the task between many
// threads to make it faster. Problem is context switching is expensive
// and problems like deadlocks (two threads waiting for the other one to
// release the memory), data race (two threads change value in bad timing)..
// Make a thread with spawn and wait for all threads to finish with a join.
// share information between threads with messages and with the move keyword.

// Heap memory -> access heap with pointers, with reference counting the memory
// is dropped when no variable points to the memory location. Useful when you
// don't know the size at compile time (stack variables size's must be known at compile time),
// or when you wan't to access that memory outside of the current scope (by passing
// a pointer to a function). In rust we do this with Box<T> (new/delete in cpp,
// malloc/free in C). It allows dynamic dispatching (creation of structs at runtime
// that have unknown size and to which we want to pass ownership).

// Copy -> It's a bytewise copy (memcpy). Type that can't be copied usually have
// something special like heap allocation (they usually implement the Drop trait).
// It basically means that the type can be copied by a straight memcpy with no
// function call or special things done (so typically for stack allocated primitives).
//
// Clone -> It's a more general trait that is like copy but for any type: you just
// need to implement the trait. It's required for heap allocated things (since u don't
// know the memory at runtime you can't copy x amount of bytes at y location in memory
// during compilation..). If something is copyable its clonable.
//
// Move -> passing ownership (taking the bytes and putting them somewhere else).

#[derive(Debug)]
struct Answer {
    a : u32,
    b : u32,
}

pub trait Summary {
    fn summarize(&self) -> ();
}

impl Summary for Answer {
    fn summarize(&self) -> () {
        format!("{}, {}", self.a, self.b);
    }
}

impl Answer {
    fn new_answer(a1: u32, b1: u32) -> Answer
    {
        Answer{a: a1, b: b1}
    }

    fn modify_a(&mut self, new_a: u32) {
        self.a = new_a;
    }

    fn print_a(&self) {
        println!("this is a: {}", self.a);
    }
}

enum Color<T> {
    Red(T),
    Blue(T),
}

fn color_value<T>(color: Color<T>) -> u8 {
    match color {
        Color::Red(whatever) => 0,
        _ => 1,
    }
}

fn two_sums(vec: &Vec<u32>, goal: u32) -> Result<Answer, &str>
{
    let mut answer : Answer = Answer { a : 0, b : 0 };

    for i in 0 .. vec.len()
    {
        for j in 1 .. vec.len()
        {
            if vec[i] + vec[j] == goal
            {
                answer.a = vec[i];
                answer.b = vec[j];
                return Ok(answer);
            }
        }
    }

    Err("couldn't find answer.")
}

fn check_palindrome(word: &str) -> bool
{
    let word_vec : Vec<char> = word.chars().collect();
    let length = word_vec.len();
    for i in 0 .. length/2
    {
        if word_vec[i] != word_vec[length-1 - i]
        {
            return false;
        }
    }
    println!("true");
    true
}

fn longest_substring(word: &str) -> u32
{
    //abcddefghhhasdga -> 3 (hhh)
    let mut longest = 1;
    let mut current_longest = 1;
    let word_vec : Vec<char> = word.chars().collect();
    let length = word_vec.len();

    for i in 1 .. length
    {
        if word_vec[i] == word_vec[i-1]
        {
            current_longest += 1;
        }
        else
        {
            current_longest = 1;
        }

        if current_longest > longest
        {
            longest = current_longest;
        }
    }

    longest
}

fn main()
{
    let vec: Vec<u32> = vec![1,2,3,4,5,6,7, 15];
    let goal: u32 = 20;
    println!("{:?}", vec);

    let mut a : Answer = Answer{a:0, b:0};
    match two_sums(&vec, goal) {
        Ok(answ)  => {a = answ},
        Err(err) => {println!("{}", err);},
    };

    println!("{:?}", &a);

    check_palindrome("abcba");
    println!("{}", longest_substring("abbbbcbaghasd"));

    let answer : Answer = Answer::new_answer(10, 15);
}

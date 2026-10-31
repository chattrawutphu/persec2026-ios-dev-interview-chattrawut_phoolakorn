import Foundation

// Check if a string is a valid parentheses sequence
func checkPalindrome(input: [Character]) -> Bool {
    if input.count % 2 != 0 {
        return false
    }
    for i in 0..<(input.count / 2) {
        if input[i] == "(" && input[(input.count - 1) - i] == ")" {
            continue
        }
        if input[i] == "[" && input[(input.count - 1) - i] == "]" {
            continue
        }
        if input[i] == "{" && input[(input.count - 1) - i] == "}" {
            continue
        }
        return false
    }
    return true
}

func test() {
    print("Running tests...")
    let test1 = Array("({})")
    let isPalindrome = checkPalindrome(input: test1)
    print("test 1 input: \(String(test1)), result: \(isPalindrome)")

    let test2 = Array("(")
    let isPalindrome2 = checkPalindrome(input: test2)
    print("test 2 input: \(String(test2)), result: \(isPalindrome2)")
    
    let test3 = Array("([[]")
    let isPalindrome3 = checkPalindrome(input: test3)
    print("test 3 input: \(String(test3)), result: \(isPalindrome3)")
    
    let test4 = Array("({[]})")
    let isPalindrome4 = checkPalindrome(input: test4)
    print("test 4 input: \(String(test4)), result: \(isPalindrome4)")

    let test5 = Array("({{]})]")
    let isPalindrome5 = checkPalindrome(input: test5)
    print("test 5 input: \(String(test5)), result: \(isPalindrome5)")
    print("test ended...")
}

func main() {
    print("\n")
    print("Pre-Interview Question 1")
    print("\n")
    test()
    print("\n---\n")
    while true {
        print("Enter your input: ")
        let input = Array(readLine() ?? "")
        print("Your input is: \(String(input))")

        let isPalindrome = checkPalindrome(input: input)
        print("Is palindrome: \(isPalindrome)")
        print("\n")
    }
}

main()

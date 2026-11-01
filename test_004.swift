import Foundation

// Check if a string is a valid parentheses sequence
func intToRoman(input: Int) -> String {
    let digits = Array(String(input))
    let inputCount = digits.count

    var inputReduced = input
    var result = ""

    if input >= 1 && input <= 3999 {
        for i in 0..<inputCount {
            if inputCount - i == 4 {
                for _ in 0..<Int(String(digits[i]))! {
                    result += "M"
                    inputReduced -= 1000
                }
                continue
            }
            if inputCount - i == 3 {
                let digit = Int(String(digits[i]))!

                if digit <= 3 {
                    for _ in 0..<digit {
                        result += "C"
                    }
                } else if digit == 4 {
                    result += "CD"
                } else if digit <= 8 {
                    result += "D"
                    for _ in 0..<(digit - 5) {
                        result += "C"
                    }
                } else {
                    result += "CM"
                }
            }
            if inputCount - i == 2 {
                let digit = Int(String(digits[i]))!

                if digit <= 3 {
                    for _ in 0..<digit {
                        result += "X"
                    }
                } else if digit == 4 {
                    result += "XL"
                } else if digit <= 8 {
                    result += "L"
                    for _ in 0..<(digit - 5) {
                        result += "X"
                    }
                } else {
                    result += "XC"
                }
            }
            if inputCount - i == 1 {
                let digit = Int(String(digits[i]))!

                if digit <= 3 {
                    for _ in 0..<digit {
                        result += "I"
                    }
                } else if digit == 4 {
                    result += "IV"
                } else if digit <= 8 {
                    result += "V"
                    for _ in 0..<(digit - 5) {
                        result += "I"
                    }
                } else {
                    result += "IX"
                }
            }
        }
    }

    return result
}
func romanToInt(_ s: String) -> Int {

    return 0
}

func test() {
    print("Running tests...")
    
    func runTest(input: Int, expected: String) {
        let result = intToRoman(input: input)
        let passed = result == expected

        print("\nTest: \(passed ? "✅ PASS" : "❌ FAIL")")
        print("Input: \(input)")
        print("Expected: \(expected)")
        print("Result: \(result)")
    }

    runTest(input: 1989, expected: "MCMLXXXIX")
    runTest(input: 2000, expected: "MM")
    runTest(input: 68, expected: "LXVIII")
    runTest(input: 109, expected: "CIX")
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
        let input = Int(readLine() ?? "") ?? 0
        print("Your input is: \(input)")

        let result = intToRoman(input: input)
        print("Result: \(result)")
        print("\n")
    }
}

main()

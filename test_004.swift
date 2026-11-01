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
func romanToInt(input: String) -> Int {
    let roman = Array(input)
    var result = 0

    for i in 0..<roman.count {
        let currentSymbol = roman[i]
        var currentValue = 0    

        if currentSymbol == "M" {
            currentValue = 1000
        } else if currentSymbol == "D" {
            currentValue = 500
        } else if currentSymbol == "C" {
            currentValue = 100
        } else if currentSymbol == "L" {
            currentValue = 50
        } else if currentSymbol == "X" {
            currentValue = 10
        } else if currentSymbol == "V" {
            currentValue = 5
        } else if currentSymbol == "I" {
            currentValue = 1
        }

        if i < roman.count - 1 {
            let nextSymbol = roman[i + 1]
            var nextValue = 0

            if nextSymbol == "M" {
                nextValue = 1000
            } else if nextSymbol == "D" {
                nextValue = 500
            } else if nextSymbol == "C" {
                nextValue = 100
            } else if nextSymbol == "L" {
                nextValue = 50
            } else if nextSymbol == "X" {
                nextValue = 10
            } else if nextSymbol == "V" {
                nextValue = 5
            } else if nextSymbol == "I" {
                nextValue = 1
            }

            if currentValue < nextValue {
                result -= currentValue
            } else {
                result += currentValue
            }
        } else {
            result += currentValue
        }
    }

    return result
}

func test() {
    print("Running tests...")
    
    func runTestIntToRoman(input: Int, expected: String) {
        let result = intToRoman(input: input)
        let passed = result == expected

        print("\nTest: \(passed ? "✅ PASS" : "❌ FAIL")")
        print("Input: \(input)")
        print("Expected: \(expected)")
        print("Result: \(result)")
    }

    func runTestRomanToInt(input: String, expected: Int) {
        let result = romanToInt(input: input)
        let passed = result == expected

        print("\nTest: \(passed ? "✅ PASS" : "❌ FAIL")")
        print("Input: \(input)")
        print("Expected: \(expected)")
        print("Result: \(result)")
    }

    print("\n--- Testing intToRoman ---")
    runTestIntToRoman(input: 1989, expected: "MCMLXXXIX")
    runTestIntToRoman(input: 2000, expected: "MM")
    runTestIntToRoman(input: 68, expected: "LXVIII")
    runTestIntToRoman(input: 109, expected: "CIX")

    print("\n--- Testing romanToInt ---")
    runTestRomanToInt(input: "MCMLXXXIX", expected: 1989)
    runTestRomanToInt(input: "MM", expected: 2000)
    runTestRomanToInt(input: "LXVIII", expected: 68)
    runTestRomanToInt(input: "CIX", expected: 109)

    print("test ended...")
}

func main() {
    print("\n")
    print("Pre-Interview Question 4")
    print("\n")
    test()
    print("\n---\n")

    while true {
        print("Enter your input: ")
        let input = readLine() ?? ""
        print("Your input is: \(input)")

        if let number = Int(input) {
            let result = intToRoman(input: number)
            print("Result: \(result)")
        } else {
            let result = romanToInt(input: input)
            print("Result: \(result)")
        }

        print("\n")
    }
}

main()

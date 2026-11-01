import Foundation

// Tribonacci sequence
func tribonacci(input: [Int], number: Int) -> [Int] {
    var result = input

    if result.count < 3 {
        return Array(result)        
    }
    
    for i in result.count..<number {
        let next = result[i-1] + result[i-2] + result[i-3]
        result.append(next)
    }
    return result
}

func test() {
    print("Running tests...")

    func runTest(input: [Int], number: Int, expected: [Int]) {
        let result = tribonacci(input: input, number: number)
        let passed = result == expected

        print("\nTest: \(passed ? "✅ PASS" : "❌ FAIL")")
        print("Input: \(input)")
        print("Expected: \(expected)")
        print("Result: \(result)")
    }

    runTest(
        input: [1, 3, 5], number: 5,
        expected: [1, 3, 5, 9, 17]
    )
    
    runTest(
        input: [2, 2, 2], number: 3,
        expected: [2, 2, 2]
    )
    
    runTest(
        input: [10, 10, 10], number: 4,
        expected: [10, 10, 10, 30]
    )

    print("test ended...")
}

func main() {
    print("\n")
    print("Pre-Interview Question 6")
    print("\n")
    test()
    print("\n---\n")
    while true {
        print("Enter your input: ")
        let input = (readLine() ?? "").split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        print("Your input is: \(input)")

        print("Enter the target length: ")
        let number = Int(readLine() ?? "0") ?? 0
        print("Number: \(number)")

        let result = tribonacci(input: input, number: number)
        print("Tribonacci value: \(result)")
        print("\n")
    }
}

main()
import Foundation

// Change to max value
func changeToMaxValue(input: Int) -> Int {
    var valaue = Array(String(input)).map { Int(String($0)) ?? 0 }
    var temp = 0
    for i in 0..<valaue.count {
        for j in i+1..<valaue.count {
            if valaue[i] < valaue[j] {
                temp = valaue[i]
                valaue[i] = valaue[j]
                valaue[j] = temp
            }
        }
    }
    return Int(valaue.map { String($0) }.joined()) ?? 0
}

func test() {
    print("Running tests...")

    func runTest(input: Int, expected: Int) {
        let result = changeToMaxValue(input: input)
        let passed = result == expected

        print("\nTest: \(passed ? "✅ PASS" : "❌ FAIL")")
        print("Input: \(input)")
        print("Expected: \(expected)")
        print("Result: \(result)")
    }

    runTest(
        input: 3008,
        expected: 8300
    )
    
    runTest(
        input: 1989,
        expected: 9981
    )
    
    runTest(
        input: 2679,
        expected: 9762
    )
    
    runTest(
        input: 9163,
        expected: 9631
    )

    print("test ended...")
}

func main() {
    print("\n")
    print("Pre-Interview Question 5")
    print("\n")
    test()
    print("\n---\n")
    while true {
        print("Enter your input: ")
        let input = (Int(readLine() ?? "0") ?? 0)
        print("Your input is: \(input)")

        let maxValue = changeToMaxValue(input: input)
        print("Max value: \(maxValue)")
        print("\n")
    }
}

main()

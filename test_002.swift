import Foundation

// Sort array function
func sortArray(_ input: [String]) -> [String] {
    return input.sorted {
        $0.localizedStandardCompare($1) == .orderedAscending
    }
}

func test() {
    print("Running tests...")

    func runTest(input: [String], expected: [String]) {
        let result = sortArray(input)
        let passed = result == expected

        print("\nTest: \(passed ? "✅ PASS" : "❌ FAIL")")
        print("Input: \(input)")
        print("Expected: \(expected)")
        print("Result: \(result)")
    }

    runTest(input: ["TH19", "SG20", "TH2"], expected: ["SG20", "TH2", "TH19"])
    runTest(input: ["TH10", "TH3Netflix", "TH1", "TH7"], expected: ["TH1", "TH3Netflix", "TH7", "TH10"])
    print("All tests ended...")
}

func main() {
    print("\n")
    print("Pre-Interview Question 2")
    print("\n")
    test()
    print("\n---\n")
    while true {
        print("Enter your input: ")
        let input = (readLine() ?? "").split(separator: ",").map(String.init)
        print("Your input is: \((input))")

        let result = sortArray(input)
        print("Sorted array: \(result)")
        print("\n")
    }
}

main()
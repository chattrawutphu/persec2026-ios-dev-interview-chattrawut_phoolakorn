import Foundation

// Sort array by country code and then by number
func sortArray(_ input: [String]) -> [String] {
    return input.sorted()
}

func test() {
    print("Running tests...")
    
    let test1 = ["TH19", "SG20", "TH2"]
    print("test 1 input: \(test1), result: \(sortArray(test1))")

    let test2 = ["TH10", "TH3Netflix", "TH1", "TH7"]
    print("test 2 input: \(test2), result: \(sortArray(test2))")
    
    print("test ended...")
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
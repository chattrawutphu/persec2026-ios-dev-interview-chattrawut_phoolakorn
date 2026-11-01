import Foundation

// Autocomplete function
func autocomplete(prefix: String, words: [String], limit: Int) -> [String] {

    // กระบวนการคิด: นับจำนวนตัวอักษรของ prefix และ words[i]
    // ถ้า words[i] มีความยาว >= prefix ให้ทำต่อได้
    // สร้าง loop j สำหรับเลื่อนตำแหน่งจุดเริ่มต้นใน words[i] (ไปจนถึงตำแหน่งที่ตัวอักษรเหลือพอให้เทียบ)
    // สร้าง loop k เพื่อเช็คว่า words[i][j+k] ตรงกับ prefix[k] ครบทุกตัวหรือไม่ (ตั้งแต่ k = 0 ถึง prefix.count - 1)
    // ถ้าตรงกับ prefix ครบทุกตัว ให้เพิ่ม words[i] ลงใน result แล้วหยุดเช็คคำนี้ทันที

    var result: [String] = []
    let prefixChars = Array(prefix.lowercased())

    for i in 0..<words.count {
        let wordChars = Array(words[i].lowercased())
        
        if wordChars.count >= prefixChars.count {
            for j in 0...(wordChars.count - prefixChars.count) {
                for k in 0..<prefixChars.count {
                    if wordChars[j + k] != prefixChars[k] {
                        break
                    } else if k == prefixChars.count - 1 {
                        result.append(words[i])
                    }
                }
                if result.last == words[i] { 
                    break 
                }
            }
        }
    }

    if result.count > limit {
        result = Array(result.prefix(limit))
    }

    return result
}

func test() {
    print("Running tests...")

    func runTest(prefix: String, words: [String], limit: Int, expected: [String]) {
        let result = autocomplete(prefix: prefix, words: words, limit: limit)
        let passed = result == expected

        print("\nTest: \(passed ? "✅ PASS" : "❌ FAIL")")
        print("Prefix: \(prefix)")
        print("Words: \(words)")
        print("Limit: \(limit)")
        print("Expected: \(expected)")
        print("Result: \(result)")
    }

    runTest(
        prefix: "th",
        words: ["Mother", "Think", "Worthy", "Apple", "Android"],
        limit: 2,
        expected: ["Mother", "Think"]
    )

    runTest(
        prefix: "app",
        words: ["Apple", "Application", "Pineapple", "Banana"],
        limit: 3,
        expected: ["Apple", "Application", "Pineapple"]
    )

    runTest(
        prefix: "TH",
        words: ["think", "MOTHER", "ThAnKs", "Apple"],
        limit: 3,
        expected: ["think", "MOTHER", "ThAnKs"]
    )

    runTest(
        prefix: "xyz",
        words: ["Apple", "Banana", "Orange"],
        limit: 2,
        expected: []
    )

    runTest(
        prefix: "a",
        words: ["Apple", "Banana", "Cat", "Android", "Grape"],
        limit: 2,
        expected: ["Apple", "Banana"]
    )

    runTest(
        prefix: "hello",
        words: ["Hi", "Hey", "Hell", "Hello"],
        limit: 5,
        expected: ["Hello"]
    )

    runTest(
        prefix: "app",
        words: [],
        limit: 2,
        expected: []
    )

    runTest(
        prefix: "app",
        words: ["Apple", "Application"],
        limit: 0,
        expected: []
    )

    runTest(
        prefix: "cat",
        words: ["Cat", "Cat", "Category", "Scatter"],
        limit: 3,
        expected: ["Cat", "Cat", "Category"]
    )

    runTest(
        prefix: "a",
        words: ["a", "A", "abc", "ba"],
        limit: 10,
        expected: ["a", "A", "abc", "ba"]
    )

    print("\nAll tests ended...")
}

func main() {
    print("\n")
    print("Pre-Interview Question 2")
    print("\n")
    test()
    print("\n---\n")
    while true {
        print("Enter your search: ")
        let searchPrefix = readLine() ?? ""
        print("Enter your limit (or press enter for no limit): ")
        let limit = Int(readLine() ?? "max") ?? Int.max
        print("Enter your words (comma-separated): ")
        let words = (readLine() ?? "").split(separator: ",").map(String.init)
        print("searchPrefix: \(searchPrefix), limit: \(limit), words: \(words)")
        let result = autocomplete(prefix: searchPrefix, words: words, limit: limit)
        print("Result: \(result)")
        print("\n")
    }
}

main()
import Foundation

final class Day3: Day {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(input: String) {
        inputData = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
    }
    
    // MARK: - Helpers
    
    func splitStringInTwo(_ input: String) -> (String, String) {
        let midpoint = input.count / 2
        let firstHalf = String(input[0..<midpoint])
        let secondHalf = String(input[midpoint..<input.count])
        return (firstHalf, secondHalf)
    }
 
    func commonCharacter(_ input: (String, String)) -> Character {
        return input.0.first(where: {input.1.contains($0)})!
    }
    
    func getPriority(_ input: Character) -> Int {
       Int(input.asciiValue!) - (input.isUppercase ? 38 : 96)
    }
    
    func commonCharacter(_ input: [String]) -> Character {
        input[0].first(where: {
            input[1].contains($0) && input[2].contains($0)
        })!
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        inputData
            .map { splitStringInTwo($0) }
            .map { commonCharacter($0) }
            .map { getPriority($0) }
            .reduce(0, +)
    }
    
    func part2() -> Int {
        inputData
            .chunked(into: 3)
            .map { commonCharacter($0) }
            .map { getPriority($0) }
            .reduce(0, +)
    }
    
}

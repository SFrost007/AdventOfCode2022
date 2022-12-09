import Foundation

final class Day1: Day {
    
    // MARK: - Initialisation
    
    let inputData: String
    
    init(input: String) {
        inputData = input
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        inputData
            .components(separatedBy: "\n\n")
            .map {
                $0.components(separatedBy: .newlines)
                    .compactMap { Int($0) }
                    .reduce(0, +)
            }
            .sorted()
            .last ?? 0
    }
    
    func part2() -> Int {
        inputData
            .components(separatedBy: "\n\n")
            .map {
                $0.components(separatedBy: .newlines)
                    .compactMap { Int($0) }
                    .reduce(0, +)
            }
            .sorted()
            .suffix(3)
            .reduce(0, +)
    }
    
}

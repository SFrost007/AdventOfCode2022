import Foundation

final class Day4: Day {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(input: String) {
        inputData = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        inputData
            .filter {
                let elfRanges = $0.components(separatedBy: ",")
                let ranges = elfRanges.map { ClosedRange<Int>(string: $0) }
                return ranges[0].contains(ranges[1]) || ranges[1].contains(ranges[0])
            }
            .count
    }
    
    func part2() -> Int {
        inputData
            .filter {
                let elfRanges = $0.components(separatedBy: ",")
                let ranges = elfRanges.map { ClosedRange<Int>(string: $0) }
                return ranges[0].overlaps(ranges[1])
            }
            .count
    }
    
}

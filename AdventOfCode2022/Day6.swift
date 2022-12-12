import Foundation

final class Day6: Day {
    
    // MARK: - Initialisation
    
    let inputData: String
    
    init(input: String) {
        inputData = input
    }
    
    // MARK: - Problem cases
    
    func findMarker(in input: String, length: Int) -> Int {
        var encountered = Set<Character>()
        for i in 0..<input.count {
            if encountered.contains(input[i]) {
                encountered.removeAll()
            } else {
                encountered.insert(input[i])
            }
            if encountered.count == length {
                return i + 1
            }
        }
        return -1
    }
    
    func part1() -> Int {
        findMarker(in: inputData, length: 4)
    }
    
    func part2() -> Int {
        findMarker(in: inputData, length: 14)
    }
    
}

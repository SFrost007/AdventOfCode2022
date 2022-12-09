import Foundation

final class DayX: Day {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(input: String) {
        inputData = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        fatalError("Not yet implemented")
    }
    
    func part2() -> Int {
        fatalError("Not yet implemented")
    }
    
}

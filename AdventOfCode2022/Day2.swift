import Foundation

final class Day2: Day {
    
    // MARK: - Initialisation
    
    let inputData: [String]
    
    init(input: String) {
        inputData = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
    }
    
    struct Match {
        enum Choice {
            case rock, paper, scissors
            
            init(_ input: Character) {
                switch input {
                case "A", "X": self = .rock
                case "B", "Y": self = .paper
                case "C", "Z": self = .scissors
                default: fatalError("Invalid input: \(input)")
                }
            }
            
            var score: Int {
                switch self {
                case .rock: return 1
                case .paper: return 2
                case .scissors: return 3
                }
            }
            
            // Part2
            var beats: Choice {
                switch self {
                case .rock: return .scissors
                case .paper: return .rock
                case .scissors: return .paper
                }
            }
            
            // Part2
            var losesTo: Choice {
                switch self {
                case .rock: return .paper
                case .paper: return .scissors
                case .scissors: return .rock
                }
            }
        }
        
        enum Result {
            case lose, draw, win
            var score: Int {
                switch self {
                case .lose: return 0
                case .draw: return 3
                case .win: return 6
                }
            }
            
            // Part2
            init(_ input: Character) {
                switch input {
                case "X": self = .lose
                case "Y": self = .draw
                case "Z": self = .win
                default: fatalError("Invalid input: \(input)")
                }
            }
        }
        
        let me: Choice
        let them: Choice
        // Part2
        let desiredResult: Result
        
        init(_ input: String) {
            me = .init(input[2])
            desiredResult = .init(input[2])
            them = .init(input[0])
        }
        
        var result: Result {
            switch (me, them) {
            case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
                return .draw
            case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
                return .win
            case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
                return .lose
            }
        }
        
        // Part2
        var choiceForDesiredResult: Choice {
            switch desiredResult {
            case .win: return them.losesTo
            case .lose: return them.beats
            case .draw: return them
            }
        }
        
        var score: Int { me.score + result.score }
        
        // Part2
        var p2score: Int { choiceForDesiredResult.score + desiredResult.score }
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        inputData
            .map { Match($0).score }
            .reduce(0, +)
    }
    
    func part2() -> Int {
        inputData
            .map { Match($0).p2score }
            .reduce(0, +)
    }
    
}

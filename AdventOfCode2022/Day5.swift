import Foundation

// Note: Doesn't conform to Day as the results are strings for once
final class Day5 {
    
    // MARK: - Initialisation
    
    let parsedStacks: CargoStacks
    let parsedInstructions: [Instruction]
    
    init(input: String) {
        (parsedStacks, parsedInstructions) = Self.parseInput(input)
    }
    
    // MARK: - Parsed structs
    
    typealias CargoStacks = [[Character]]
    
    struct Instruction {
        let quantity: Int
        let moveFrom: Int
        let moveTo: Int
        
        init(string: String) {
            let parts = string.components(separatedBy: .whitespaces)
            quantity = Int(parts[1])!
            moveFrom = Int(parts[3])! - 1 // Adjusted for zero-offset array indices
            moveTo = Int(parts[5])! - 1 // Adjusted for zero-offset array indices
        }
    }
    
    private static func parseInput(_ input: String) -> (stacks: CargoStacks, instructions: [Instruction]) {
        let parts = input.components(separatedBy: "\n\n")
        let instructions = parts[1]
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .map { Instruction(string: $0) }
        
        let inputLines = parts[0].components(separatedBy: .newlines).reversed()
        // Hardcoded hack to allow 9 stacks as the starting point
        let columns = 9
        var stacks: CargoStacks = []
        for _ in 0..<columns {
            let newArray: [Character] = []
            stacks.append(newArray)
        }
        for line in inputLines {
            for i in 0..<columns {
                let characterOffset = (i*4)+1
                guard line.count >= characterOffset else { continue }
                let character = line[characterOffset]
                if character != " " { // Don't push empty spaces
                    stacks[i].append(character)
                }
            }
        }
        return (stacks: stacks, instructions: instructions)
    }
    
    // MARK: - Part 1
    
    func part1() -> String {
        let processed = Self.runInstructions(parsedInstructions, on: parsedStacks)
        return Self.getTopItems(from: processed)
    }
    
    private static func runInstructions(_ instructions: [Instruction], on stacks: CargoStacks) -> CargoStacks {
        var stacks = stacks
        for instruction in instructions {
            for _ in 0..<instruction.quantity {
                stacks[instruction.moveTo].append(stacks[instruction.moveFrom].popLast()!)
            }
        }
        return stacks
    }
    
    private static func getTopItems(from stacks: CargoStacks) -> String {
        var result = ""
        for stack in stacks {
            result.append(stack.last ?? Character(" "))
        }
        return result.trimmingCharacters(in: .whitespaces)
    }
    
    // MARK: - Part 2
    
    func part2() -> String {
        let processed = Self.runInstructionsPart2(parsedInstructions, on: parsedStacks)
        return Self.getTopItems(from: processed)
    }
    
    private static func runInstructionsPart2(_ instructions: [Instruction], on stacks: CargoStacks) -> CargoStacks {
        var stacks = stacks
        for instruction in instructions {
            var grabbedItems = ""
            for _ in 0..<instruction.quantity {
                grabbedItems.append(stacks[instruction.moveFrom].popLast()!)
            }
            for char in grabbedItems.reversed() {
                stacks[instruction.moveTo].append(char)
            }
        }
        return stacks
    }
    
}

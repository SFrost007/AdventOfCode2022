import XCTest
@testable import AdventOfCode2022

class Day2Tests: AoCTestCase {
    
    let example = Day2(input: exampleInput(day: 2))
    let myInput = Day2(input: myInput(day: 2))
    
    func testParsing() {
        // Note: Not always required
    }
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 15)
        printAnswer(day: 2, part: 1, answer: myInput.part1())
        measure { XCTAssertEqual(myInput.part1(), 11386) }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 12)
        printAnswer(day: 2, part: 2, answer: myInput.part2())
        measure { XCTAssertEqual(myInput.part2(), 13600) }
    }

}

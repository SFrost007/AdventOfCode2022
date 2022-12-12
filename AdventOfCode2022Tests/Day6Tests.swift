import XCTest
@testable import AdventOfCode2022

class Day6Tests: AoCTestCase {
    
    let myInput = Day6(input: myInput(day: 6))
    
    func testParsing() {
        // Note: Not always required
    }
    
    func testPart1() {
        printAnswer(day: 6, part: 1, answer: myInput.part1())
        measure { XCTAssertEqual(myInput.part1(), 1093) }
    }
    
    func testPart2() {
        printAnswer(day: 6, part: 2, answer: myInput.part2())
        measure { XCTAssertEqual(myInput.part2(), 3534) }
    }

}

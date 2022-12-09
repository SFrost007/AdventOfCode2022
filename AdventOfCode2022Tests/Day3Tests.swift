import XCTest
@testable import AdventOfCode2022

class Day3Tests: AoCTestCase {
    
    let example = Day3(input: exampleInput(day: 3))
    let myInput = Day3(input: myInput(day: 3))
    
    func testParsing() {
        // Note: Not always required
    }
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 157)
        printAnswer(day: 3, part: 1, answer: myInput.part1())
        measure { XCTAssertEqual(myInput.part1(), 7742) }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 70)
        printAnswer(day: 3, part: 2, answer: myInput.part2())
        measure { XCTAssertEqual(myInput.part2(), 2276) }
    }

}

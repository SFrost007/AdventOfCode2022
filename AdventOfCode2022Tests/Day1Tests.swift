import XCTest
@testable import AdventOfCode2022

class Day1Tests: AoCTestCase {
    
    let example = Day1(input: exampleInput(day: 1))
    let myInput = Day1(input: myInput(day: 1))
    
    func testParsing() {
        // Note: Not always required
    }
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 24000)
        printAnswer(day: 1, part: 1, answer: myInput.part1())
        measure { XCTAssertEqual(myInput.part1(), 71124) }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 45000)
        printAnswer(day: 1, part: 2, answer: myInput.part2())
        measure { XCTAssertEqual(myInput.part2(), 204639) }
    }

}

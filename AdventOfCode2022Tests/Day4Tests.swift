import XCTest
@testable import AdventOfCode2022

class Day4Tests: AoCTestCase {
    
    let example = Day4(input: exampleInput(day: 4))
    let myInput = Day4(input: myInput(day: 4))
    
    func testParsing() {
        // Note: Not always required
    }
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 2)
        printAnswer(day: 4, part: 1, answer: myInput.part1())
        measure { XCTAssertEqual(myInput.part1(), 444) }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 4)
        printAnswer(day: 4, part: 2, answer: myInput.part2())
        measure { XCTAssertEqual(myInput.part2(), 801) }
    }

}

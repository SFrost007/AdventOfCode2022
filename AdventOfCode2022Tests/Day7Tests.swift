import XCTest
@testable import AdventOfCode2022

class Day7Tests: AoCTestCase {
    
    let example = Day7(input: exampleInput(day: 7))
    let myInput = Day7(input: myInput(day: 7))
    
    func testParsing() {
        // Note: Not always required
    }
    
    func testPart1() {
        XCTAssertEqual(example.part1(), 95437)
        printAnswer(day: 7, part: 1, answer: myInput.part1())
        measure { XCTAssertEqual(myInput.part1(), 2104783) }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), 24933642)
        printAnswer(day: 7, part: 2, answer: myInput.part2())
        measure { XCTAssertEqual(myInput.part2(), 5883165) }
    }

}

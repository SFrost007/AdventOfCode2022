import XCTest
@testable import AdventOfCode2022

class Day5Tests: AoCTestCase {
    
    let example = Day5(input: exampleInput(day: 5))
    let myInput = Day5(input: myInput(day: 5))
    
    func testParsing() {
        // Note: Not always required
    }
    
    func testPart1() {
        XCTAssertEqual(example.part1(), "CMZ")
        printAnswer(day: 5, part: 1, answer: myInput.part1())
        measure { XCTAssertEqual(myInput.part1(), "BSDMQFLSP") }
    }
    
    func testPart2() {
        XCTAssertEqual(example.part2(), "MCD")
        printAnswer(day: 5, part: 2, answer: myInput.part2())
        measure { XCTAssertEqual(myInput.part2(), "PGSQBFLDP") }
    }

}

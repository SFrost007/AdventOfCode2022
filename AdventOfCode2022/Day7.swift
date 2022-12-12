import Foundation

final class Day7: Day {
    
    // MARK: - Initialisation
    
    let rootNode: Directory
    
    init(input: String) {
        rootNode = Self.parse(input: input)
    }
    
    // MARK: - Classes
    
    class Node {
        let parent: Directory?
        let name: String
        
        init(name: String, parent: Directory?) {
            self.parent = parent
            self.name = name
        }
    }

    class Directory: Node {
        var children: [Node] = []
        
        func size() -> Int {
            children.compactMap {
                if let dir = $0 as? Directory {
                    return dir.size()
                } else if let file = $0 as? File {
                    return file.size
                } else {
                    fatalError("What is this??")
                }
            }.reduce(0, +)
        }
        
        func recursiveChildren() -> [Node] {
            var result: [Node] = [self]
            for node in children {
                if let dir = node as? Directory {
                    result.append(contentsOf: dir.recursiveChildren())
                } else {
                    result.append(node)
                }
            }
            return result
        }
    }

    class File: Node {
        let size: Int
        
        init(name: String, size: Int, parent: Directory) {
            self.size = size
            super.init(name: name, parent: parent)
        }
    }
    
    // MARK: - Parsing
    
    // Returns root directory
    private static func parse(input: String) -> Directory {
        let rootDir = Directory(name: "/", parent: nil)
        var currentDir: Directory = rootDir
        
        let commands = input.components(separatedBy: "$ ")
        for command in commands[2...] { // Skip the first "cd /"
            let output = command.components(separatedBy: .newlines).filter { !$0.isEmpty }
            let cmd = output[0]
            
            if cmd == "ls" {
                for item in output[1...] { // Skip the "ls"
                    let parts = item.components(separatedBy: " ")
                    let newItem: Node
                    if parts[0] == "dir" {
                        newItem = Directory(name: parts[1], parent: currentDir)
                    } else {
                        newItem = File(name: parts[1], size: Int(parts[0])!, parent: currentDir)
                    }
                    currentDir.children.append(newItem)
                }
            } else if cmd == "cd .." {
                currentDir = currentDir.parent!
            } else if cmd.hasPrefix("cd ") {
                let newDirName = cmd.components(separatedBy: " ")[1]
                currentDir = currentDir.children.compactMap { $0 as? Directory }.first(where: { $0.name == newDirName })!
            }
        }
        return rootDir
    }
    
    // MARK: - Problem cases
    
    func part1() -> Int {
        let flattened = rootNode.recursiveChildren().filter { $0.name != "/" }
        let directories = flattened.compactMap { $0 as? Directory }
        return directories.map { $0.size() }.filter { $0 <= 100000 }.reduce(0, +)
    }
    
    func part2() -> Int {
        let totalSpace = 70_000_000
        let requiredSpace = 30_000_000
        let usedSpace = rootNode.size()
        let remainingSpace = totalSpace - usedSpace
        
        let allDirectories = rootNode.recursiveChildren().compactMap { $0 as? Directory }
        let directorySizes = allDirectories.map { $0.size() }.sorted()
        
        return directorySizes.first(where: { $0 >= requiredSpace - remainingSpace }) ?? 0
    }
    
}

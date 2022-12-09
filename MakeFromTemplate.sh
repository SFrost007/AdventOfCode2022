#!/bin/sh

if [ $# -eq 0 ]; then
  echo "Usage: $(basename $0) daynumber"
  exit 1
fi

DAYNUMBER=$1
cp "Template/DayX.swift" "AdventOfCode2022/Day${DAYNUMBER}.swift"
sed -i '' "s/DayX_Number/$DAYNUMBER/" "AdventOfCode2022/Day${DAYNUMBER}.swift"
sed -i '' "s/DayX/Day$DAYNUMBER/" "AdventOfCode2022/Day${DAYNUMBER}.swift"

cp "Template/DayXTests.swift" "AdventOfCode2022Tests/Day${DAYNUMBER}Tests.swift"
sed -i '' "s/DayX_Number/$DAYNUMBER/" "AdventOfCode2022Tests/Day${DAYNUMBER}Tests.swift"
sed -i '' "s/DayX/Day$DAYNUMBER/" "AdventOfCode2022Tests/Day${DAYNUMBER}Tests.swift"

touch "AdventOfCode2022Tests/InputData/Day${DAYNUMBER}_Example.txt"
if [ -f authcookie.txt ]; then
  curl "https://adventofcode.com/2022/day/${DAYNUMBER}/input" \
    -b "session=`cat authcookie.txt`" \
    -o "AdventOfCode2022Tests/InputData/Day${DAYNUMBER}_MyInput.txt"
else
  touch "AdventOfCode2022Tests/InputData/Day${DAYNUMBER}_MyInput.txt"
fi

if ! gem spec xcodeproj > /dev/null 2>&1; then
    echo "Done! Just add to Xcodeproj"
    open "AdventOfCode2022"
    open "AdventOfCode2022Tests"
else
    # From https://shr3jn.medium.com/adding-files-to-your-xcode-project-from-terminal-dabe8402fdb5
    ruby -e """
    require 'xcodeproj'

    project = Xcodeproj::Project.open('AdventOfCode2022.xcodeproj')

    group = project.main_group['AdventOfCode2022']
    file = group.new_file('Day${DAYNUMBER}.swift')
    main_target = project.targets.first
    main_target.add_file_references([file])

    testGroup = project.main_group['AdventOfCode2022Tests']
    testFile = testGroup.new_file('Day${DAYNUMBER}Tests.swift')
    main_target = project.targets.last
    main_target.add_file_references([testFile])
    
    dataGroup = project.main_group['AdventOfCode2022Tests']['InputData']
    exampleInput = dataGroup.new_file('Day${DAYNUMBER}_Example.txt')
    myInput = dataGroup.new_file('Day${DAYNUMBER}_MyInput.txt')
    main_target = project.targets.last
    main_target.add_resources([exampleInput, myInput])

    project.save
    """
fi

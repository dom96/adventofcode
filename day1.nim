
import strutils
type
  CircularString = distinct string

proc len(input: CircularString): int {.borrow.}

proc `[]`(input: CircularString, i: int): char =
  ## Treats ``input`` as a circular list, so the index loops around to
  ## the beginning.
  let len = input.len
  return input.string[i - (len * (i div len))]

proc solve(input: CircularString): tuple[part1, part2: int] =
  result = (0, 0)
  for i in 0..<input.len:
    if input[i] == input[i+1]:
      result[0] += parseInt($input[i])
    if input[i] == input[i+(input.len div 2)]:
      result[1] += parseInt($input[i])

when isMainModule:
  # Part 1
  doAssert solve("1122".CircularString)[0] == 3
  doAssert solve("1111".CircularString)[0] == 4
  doAssert solve("1234".CircularString)[0] == 0
  doAssert solve("91212129".CircularString)[0] == 9

  # Part 2
  doAssert solve("1212".CircularString)[1] == 6
  doAssert solve("1221".CircularString)[1] == 0
  doAssert solve("123425".CircularString)[1] == 4
  doAssert solve("123123".CircularString)[1] == 12
  doAssert solve("12131415".CircularString)[1] == 4

  let input = readFile("day1.input").strip().CircularString
  let (part1, part2) = input.solve()
  echo("Part 1 answer: ", part1)
  echo("Part 2 answer: ", part2)



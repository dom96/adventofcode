
import strutils
type
  CircularString = distinct string

proc len(input: CircularString): int {.borrow.}

proc `[]`(input: CircularString, i: int): char =
  ## Treats ``input`` as a circular list, so the index loops around to
  ## the beginning.
  let len = input.len
  return input.string[i - (len * (i div len))]

proc solve(input: CircularString): int =
  result = 0
  for i in 0..<input.len:
    if input[i] == input[i+1]:
      result += parseInt($input[i])

when isMainModule:
  doAssert solve("1122".CircularString) == 3
  doAssert solve("1111".CircularString) == 4
  doAssert solve("1234".CircularString) == 0
  doAssert solve("91212129".CircularString) == 9

  let input = readFile("day1.input").strip().CircularString
  let answer = input.solve()
  echo("Answer: ", answer)


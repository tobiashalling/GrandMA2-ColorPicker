--Main function works now. does create and label a macro

function print (msg)
  gma.feedback(msg)
  gma.echo(msg)
end

-- range(start)             returns an iterator from 1 to a (step = 1)
-- range(start, stop)       returns an iterator from a to b (step = 1)
-- range(start, stop, step) returns an iterator from a to b, counting by step.
range =
    function (i, to, inc)
        if i == nil then return end -- range(--[[ no args ]]) -> return "nothing" to fail the loop in the caller

        if not to then
            to = i 
            i  = to == 0 and 0 or (to > 0 and 1 or -1) 
        end 

        -- we don't have to do the to == 0 check
        -- 0 -> 0 with any inc would never iterate
        inc = inc or (i < to and 1 or -1) 

        -- step back (once) before we start
        i = i - inc 

        return function () if i == to then return nil end i = i + inc return i, i end 
    end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function macroNum (msg, placeholder)
    placeholder = placeholder or ''
    local userInput = ''
    repeat
      userInput = gma.textinput(msg, placeholder)
    until userInput ~= placeholder
  
    return userInput
end

function macroFromTo (msg1, msg2, placeholder1, placeholder2)
  placeholder1 = placeholder1 or ''
  local userInput1 = ''
  repeat
    userInput1 = gma.textinput(msg1, placeholder1)
  until userInput1 ~= placeholder1

  placeholder2 = placeholder2 or ''
  local userInput2 = ''
  repeat
    userInput2 = gma.textinput(msg2, placeholder2)
  until userInput2 ~= placeholder2

  FromTo = {userInput1, userInput2}
  return FromTo
end

function label (msg, placeholder)
    placeholder = placeholder or ''
    local userInput = ''
    repeat
      userInput = gma.textinput(msg, placeholder)
    until userInput ~= placeholder
  
    return userInput
end

function main ()
  -- Create macros
  local numColors = 12
  local macroStart = macroNum('Enter start macro', 800)
  local macroEnd = macroStart + numColors
  gma.cmd('Store Macro 1.'..macroStart..' thru '..math.floor(macroEnd))
  
  --local macrosTest = macroFromTo('From macro', 'To macro', 800, 801)
  --local macroRange = {range(macrosTest[0], macrosTest[1])}
  print(macroEnd)
  --print(macroRange)

  local colors = {
  ['White'] = 1, ['Red'] = 2, ['Orange'] = 3, ['Yellow'] = 4, ['Lime'] = 5, ['Green'] = 6, 
  ['Coral'] = 7, ['Turquoise'] = 8, ['LightBlue'] = 9, ['Blue'] = 10, ['Purple'] = 11, 
  ['Pink'] = 12, ['Magenta'] = 13,}

  -- rename macros
  -- for i in tablelength(colors) do
  --for i = 1, 13 do
    --gma.cmd('Label Macro 1.'..macroNum..' \"'..colors[i]..'\"')
    --gma.cmd('Label Macro 1.'..macroRange..' \"'..colors[i]..'\"')
  --end
  --local macroNum = {range(macroStart, macroEnd, 1)}
  local macroNum = {1 + macroStart, 2 + macroStart, 3 + macroStart, 4 + macroStart, 
  5 + macroStart, 6 + macroStart, 7 + macroStart, 8 + macroStart, 9 + macroStart, 
  10 + macroStart, 11 + macroStart, 12 + macroStart, 13 + macroStart}
  print(macroNum)
  gma.cmd('Label Macro 1.'..macroNum[1]..' \"'..colors[1]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[2]..' \"'..colors[2]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[3]..' \"'..colors[3]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[4]..' \"'..colors[4]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[5]..' \"'..colors[5]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[6]..' \"'..colors[6]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[7]..' \"'..colors[7]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[8]..' \"'..colors[8]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[9]..' \"'..colors[9]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[10]..' \"'..colors[10]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[11]..' \"'..colors[11]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[12]..' \"'..colors[12]..'\"')
  gma.cmd('Label Macro 1.'..macroNum[13]..' \"'..colors[13]..'\"')

end

return main


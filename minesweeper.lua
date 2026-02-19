-- マインスイーパ最小サンプル
local display = display
local SIZE = 5
local MINES = 5
local cells = {}

-- ランダムに地雷を配置
local mines = {}
for i = 1, MINES do
    local r, c
    repeat
        r = math.random(1, SIZE)
        c = math.random(1, SIZE)
    until not mines[r..","..c]
    mines[r..","..c] = true
end

-- セルを作る
for r = 1, SIZE do
    cells[r] = {}
    for c = 1, SIZE do
        local rect = display.newRect(50*c, 50*r, 40, 40)
        rect:setFillColor(0.7, 0.7, 0.7)
        rect.strokeWidth = 2
        rect:setStrokeColor(0,0,0)
        rect:addEventListener("tap", function()
            if mines[r..","..c] then
                rect:setFillColor(1,0,0)
                print("Game Over!")
            else
                rect:setFillColor(0.9,0.9,0.9)
            end
        end)
        cells[r][c] = rect
    end
end

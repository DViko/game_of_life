#include "raylib.h"
#include "grid.hpp"

void Grid::Draw()
{
    for (int column = 0; column < columns; column++)
    {
        for (int row = 0; row < rows; row++)
        {
            Color color = cells[row][column] ? Color{0, 255, 0, 255} : Color{50, 50, 50, 255};
            DrawRectangle(column * cellSize, row * cellSize, cellSize - 1, cellSize - 1, color);
        }
    }
}
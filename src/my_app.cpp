#include "raylib.h"
#include "grid.hpp"

int main() {

    const int SCREEN_WIDTH = 750;
    const int SCREEN_HEIGHT = 750;
    const int CELL_SIZE = 25;
    const int MAX_FPS = 20;

    Color BACKGROUND = {5, 5, 5, 255};

    InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Test Window");
    SetTargetFPS(MAX_FPS);

    Grid grid(SCREEN_WIDTH, SCREEN_HEIGHT, CELL_SIZE);

    while (!WindowShouldClose()) {

        BeginDrawing();
        ClearBackground(BACKGROUND);
        grid.Draw();
        EndDrawing();
    }

    CloseWindow();

    return 0;
}
#include "raylib/include/raylib.h"
#include <stdio.h>

int main(void) {
    SetConfigFlags(FLAG_WINDOW_RESIZABLE | FLAG_WINDOW_HIGHDPI);
    InitWindow(1200, 800, "raylib web template");
    SetTargetFPS(60);

    const char *text = "Hello, Browser!";
    int fontSize = 32;
    int textWidth = MeasureText(text, fontSize);

    printf("Hello, Console!\n");

    while (!WindowShouldClose()) {
        int WIDTH = GetRenderWidth();
        int HEIGHT = GetRenderHeight();

        BeginDrawing();
        ClearBackground((Color){0x18, 0x18, 0x18, 0xFF});
        DrawText(text, WIDTH/2 - textWidth/2, HEIGHT/2 - fontSize/2, fontSize, RAYWHITE);

        EndDrawing();
    }

    CloseWindow();
    return 0;
}

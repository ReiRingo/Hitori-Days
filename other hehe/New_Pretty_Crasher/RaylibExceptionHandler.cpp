/*      -- PRETTY CRASHER 2.0
 *      A slightly better version of Pretty Crasher.
 *      By Velvet Clover, 2026
 *      Via Raylib
 */

#include "include/raylib.h" // datafiles/include
#include <iostream>
#include <algorithm>

#define dllx extern "C" __declspec(dllexport)

dllx double crash(char* exception, char* message, double width, double height, char* spritePath, char* windowName, double fps =  60/*, char* font = "nan"*/) {
    // Pop-up-ish! (Borderless)
    SetConfigFlags(FLAG_WINDOW_TOPMOST | FLAG_WINDOW_UNDECORATED);

    // Window
    int windowWidth = (int)width;
    int windowHeight = (int)height;

    InitWindow(windowWidth, windowHeight, windowName);

    // Loop FPS (Simple)
    int _fps = std::clamp( (int)fps, 15, 120 );
    SetTargetFPS(_fps);

    // Usables
    Texture2D sprite = LoadTexture(spritePath);
    float alpha = 0.0f;

    // Never knew I'd be making a game for another game's crash.
    while(!WindowShouldClose()) {
        // if (IsKeyPressed(KEY_ESCAPE)) CloseWindow(); // < Automatically done, apparantly

        if (alpha < 1.0f)
            alpha += 0.02f;
        
        BeginDrawing();
            // -- The Art (Emotionally Intelligent~!)
            // Background (fallback)
            ClearBackground(DARKGRAY);

            // Background
            if (sprite.id == 0) DrawTextureEx(sprite, (Vector2){ 0, 0 }, 0.0f, 1.0f, Fade(WHITE, alpha));

            // Foreground
            DrawRectangle(20, 20, windowWidth - 40, windowHeight - 80, Fade(BLACK, 0.6f));

            // Text Content
            DrawText(exception, 40, 40, 20, RED);
            DrawText(message, 40, 70, 16, RAYWHITE);

            // Hints
            DrawText("Press ESC to Close", windowWidth / 2 - 50, windowHeight - 30, 10, GRAY);
        EndDrawing();
    }

    if (sprite.id == 0) UnloadTexture(sprite);
    CloseWindow();

    return 1.0;
}
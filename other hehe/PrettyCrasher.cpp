// PrettyCrasher.cpp : Defines the exported functions for the DLL application.
// By Velvet Clover, 2026
// This DLL creates a custom crash window with a specified message and background image.

#include <windows.h>
#include <gdiplus.h>
#include <string>

using namespace Gdiplus;

#define GmFunction extern "C" __declspec(dllexport)

LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    static Gdiplus::Image* bgImage = nullptr;

    switch (msg)
    {
        case WM_CREATE:
        {
            CREATESTRUCT* pCreate = (CREATESTRUCT*)lParam;
            wchar_t* widePath = (wchar_t*)pCreate->lpCreateParams;
            if (widePath) bgImage = new Gdiplus::Image(widePath);
            break;
        }
        case WM_PAINT:
        {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hwnd, &ps);
            Graphics graphics(hdc);
            if (bgImage && bgImage->GetLastStatus() == Ok)
            {
                graphics.DrawImage(bgImage, 0, 0);
            }
            else
            {
                Rect rect(0, 0, 1280, 720);
                SolidBrush brush(Color(255, 40, 40, 45));
                graphics.FillRectangle(&brush, rect);
            }
            EndPaint(hwnd, &ps);
            break;
        }
        case WM_DESTROY:
            if (bgImage) delete bgImage;
            PostQuitMessage(0);
            break;
        case WM_CTLCOLORSTATIC:
        {
            HDC hdcStatic = (HDC)wParam;
            SetTextColor(hdcStatic, RGB(0, 0, 0)); 
            SetBkMode(hdcStatic, TRANSPARENT);
            return (LRESULT)GetStockObject(NULL_BRUSH);
        }
        default:
            return DefWindowProc(hwnd, msg, wParam, lParam);
    }
    return 0;
}

GmFunction double crashPrettifier(char* message, double width, double height, char* imagePath)
{
    GdiplusStartupInput gdiplusStartupInput;
    ULONG_PTR gdiplusToken;
    GdiplusStartup(&gdiplusToken, &gdiplusStartupInput, NULL);

    wchar_t wPath[MAX_PATH];
    MultiByteToWideChar(CP_UTF8, 0, imagePath, -1, wPath, MAX_PATH);

    WNDCLASS wc = { 0 };
    wc.lpfnWndProc = WndProc;
    wc.hInstance = GetModuleHandle(NULL);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.lpszClassName = "GMCrashWindow";
    RegisterClass(&wc);

    HWND hwnd = CreateWindowEx(WS_EX_TOPMOST, "GMCrashWindow", "Programme has Crashed!",
        WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU,
        CW_USEDEFAULT, CW_USEDEFAULT, (int)width, (int)height,
        NULL, NULL, wc.hInstance, (LPVOID)wPath);

    CreateWindow("STATIC", message, WS_VISIBLE | WS_CHILD | SS_LEFT, 
                 20, 20, (int)width - 40, (int)height - 80, hwnd, NULL, wc.hInstance, NULL);

    ShowWindow(hwnd, SW_SHOW);
    UpdateWindow(hwnd);

    MSG msg;
    while (GetMessage(&msg, NULL, 0, 0))
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    GdiplusShutdown(gdiplusToken);
    return 1.0;
}
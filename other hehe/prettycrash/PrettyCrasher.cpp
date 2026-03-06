/*
 * *************************************************************
 * GameMaker custom exception handler made by Rei Taylor -- ****
 * *************************************************************
 * Originally made for the programme "Hitori Days" by also me!
 * It's pretty neat.
 * Though, not that advanced.
 * Thank you for using this silly product!
 */

#include <windows.h>
#include <gdiplus.h>
#include <string>
#include <vector>

using namespace Gdiplus;

#define GmFunction extern "C" __declspec(dllexport)

// Global states
Color gBgColour(255, 40, 40, 45);
Color gTextColour(255, 0, 0, 0); // Black!

std::wstring gFontFamily = L"Arial";
float gFontSize = 12.0f;
std::wstring gMessage = L"Unknown Error";

GmFunction double setCrashColour(double r, double g, double b, double a) {
    gBgColour = Color((BYTE)(a * 255), (BYTE)(r * 255), (BYTE)(g * 255), (BYTE)(b * 255));
    return 1.0;
}

GmFunction double setCrashTextColour(double r, double g, double b, double a) {
    gTextColour = Color((BYTE)(a * 255), (BYTE)(r * 255), (BYTE)(g * 255), (BYTE)(b * 255));
    return 1.0;
}

GmFunction double setCrashFont(const char* fontName, double fontSize) {
    int len = MultiByteToWideChar(CP_UTF8, 0, fontName, -1, NULL, 0);
    std::vector<wchar_t> buffer(len);
    MultiByteToWideChar(CP_UTF8, 0, fontName, -1, buffer.data(), len);
    gFontFamily = buffer.data();
    gFontSize = (float)fontSize;
    return 1.0;
}

LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
    static Gdiplus::Image* bgImage = nullptr;

    switch (msg) {
        case WM_CREATE: {
            CREATESTRUCTW* pCreate = (CREATESTRUCTW*)lParam;
            const wchar_t* widePath = (const wchar_t*)pCreate->lpCreateParams;
            if (widePath && wcslen(widePath) > 0) {
                bgImage = Image::FromFile(widePath);
            }
            break;
        }
        case WM_PAINT: {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hwnd, &ps);
            {
                Graphics graphics(hdc);
                graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);

                Rect rect;
                GetClientRect(hwnd, (LPRECT)&rect);
                
                SolidBrush bgBrush(gBgColour);
                graphics.FillRectangle(&bgBrush, 0, 0, rect.Width, rect.Height);

                if (bgImage && bgImage->GetLastStatus() == Ok) {
                    graphics.DrawImage(bgImage, 0, 0);
                }

                Font font(gFontFamily.c_str(), gFontSize);
                SolidBrush textBrush(gTextColour);
                RectF layout(20.0f, 20.0f, (float)rect.Width - 40.0f, (float)rect.Height - 40.0f);
                graphics.DrawString(gMessage.c_str(), -1, &font, layout, NULL, &textBrush);
            }
            EndPaint(hwnd, &ps);
            break;
        }
        case WM_DESTROY:
            if (bgImage) { delete bgImage; bgImage = nullptr; }
            PostQuitMessage(0);
            break;
        default:
            return DefWindowProcW(hwnd, msg, wParam, lParam);
    }
    return 0;
}

GmFunction double showPrettyCrash(const char* message, double width, double height, const char* imagePath) {
    GdiplusStartupInput gdiInput;
    ULONG_PTR gdiToken;
    if (GdiplusStartup(&gdiToken, &gdiInput, NULL) != Ok) return 0.0;

    // Convert message
    int mLen = MultiByteToWideChar(CP_UTF8, 0, message, -1, NULL, 0);
    std::vector<wchar_t> msgBuf(mLen);
    MultiByteToWideChar(CP_UTF8, 0, message, -1, msgBuf.data(), mLen);
    gMessage = msgBuf.data();

    // Convert path
    wchar_t wPath[MAX_PATH];
    MultiByteToWideChar(CP_UTF8, 0, imagePath, -1, wPath, MAX_PATH);

    HINSTANCE hInst = GetModuleHandle(NULL);
    WNDCLASSW wc = {0};
    wc.lpfnWndProc = WndProc;
    wc.hInstance = hInst;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.lpszClassName = L"GMCrashWindow";
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    
    RegisterClassW(&wc);

    HWND hwnd = CreateWindowExW(WS_EX_TOPMOST, L"GMCrashWindow", L"Critical Error",
        WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU,
        CW_USEDEFAULT, CW_USEDEFAULT, (int)width, (int)height,
        NULL, NULL, hInst, (LPVOID)wPath);

    if (!hwnd) return 0.0;

    ShowWindow(hwnd, SW_SHOW);
    UpdateWindow(hwnd);

    MSG msg;
    while (GetMessageW(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessageW(&msg);
    }

    GdiplusShutdown(gdiToken);
    UnregisterClassW(L"GMCrashWindow", hInst);
    return 1.0;
}
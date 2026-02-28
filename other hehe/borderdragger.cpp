#include <windows.h>


WNDPROC oldProc = NULL;

LRESULT CALLBACK newProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
    switch(msg) {
        case WM_NCCALCSIZE:
            if (wParam == TRUE) return 0;
            break;
        
        case WM_NCHITTEST: {
            LRESULT hit = DefWindowProc(hwnd, msg, wParam, lParam);
            POINT pt = { LOWORD(lParam), HIWORD(lParam) };
            ScreenToClient(hwnd, &pt);
            if (pt.y < 30) return HTCAPTION;
            return hit;
        }
    }

    return CallWindowProc(oldProc, hwnd, msg, wParam, lParam);
}

/// C++ -> GameMaker Extern
#define GMFunc extern "C" __declspec(dllexport)
#define GMTrue 1.0
#define GMFalse 0.0
#define GMBool double
#define GMReal double

GMFunc GMBool windowInit(void* hwnd) {
    HWND handle = (HWND)hwnd;
    WNDPROC proc = (WNDPROC)SetWindowLongPtr(handle, GWLP_WNDPROC, (LONG_PTR)newProc);
    oldProc = proc;
    SetWindowPos(handle, NULL, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE | SWP_NOZORDER | SWP_FRAMECHANGED);
    return GMTrue;
}

GMFunc GMBool windowDeinit(void* hwnd) {
    HWND handle = (HWND)hwnd;
    SetWindowLongPtr(handle, GWLP_WNDPROC, (LONG_PTR)oldProc);
    return GMTrue;
}
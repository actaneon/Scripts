#include <CoreFoundation/CoreFoundation.h>

// cc -o notif notif.c -framework CoreFoundation

int main(int argc, char ** argv)
{
    CFMessagePortRef port = CFMessagePortCreateRemote(NULL, CFSTR("com.apple.loginwindow.notify"));
    CFMessagePortSendRequest(port, 500, 0, 0, 0, 0, 0);
    CFRelease(port);
    return 0;
}

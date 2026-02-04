/* lock-keyboard: Grabs keyboard until Shift+F13 is pressed */
#include <X11/Xlib.h>
#include <X11/keysym.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

#define LED_PATH "/sys/class/leds/input6::capslock/brightness"

static Display *dpy;
static Window root;

static void led_set(int on) {
    FILE *f = fopen(LED_PATH, "w");
    if (f) {
        fprintf(f, "%d", on);
        fclose(f);
    }
}

static void cleanup(int sig) {
    (void)sig;
    XUngrabKeyboard(dpy, CurrentTime);
    led_set(0);
    XCloseDisplay(dpy);
    exit(0);
}

static int key_is_pressed(KeyCode keycode) {
    char keys[32];
    XQueryKeymap(dpy, keys);
    return keys[keycode / 8] & (1 << (keycode % 8));
}

int main(void) {
    XEvent ev;
    KeySym ksym;
    int grab_result;
    KeyCode f13_keycode;

    dpy = XOpenDisplay(NULL);
    if (!dpy) {
        fprintf(stderr, "lock-keyboard: cannot open display\n");
        return 1;
    }

    root = DefaultRootWindow(dpy);
    f13_keycode = XKeysymToKeycode(dpy, XK_F13);

    /* Wait for F13 to be released before grabbing */
    while (key_is_pressed(f13_keycode))
        usleep(5000); /* 5ms */

    grab_result = XGrabKeyboard(dpy, root, True, GrabModeAsync, GrabModeAsync, CurrentTime);
    if (grab_result != GrabSuccess) {
        fprintf(stderr, "lock-keyboard: failed to grab keyboard (code %d)\n", grab_result);
        XCloseDisplay(dpy);
        return 1;
    }

    led_set(1);

    signal(SIGTERM, cleanup);
    signal(SIGINT, cleanup);

    while (1) {
        XNextEvent(dpy, &ev);
        if (ev.type == KeyPress) {
            ksym = XLookupKeysym(&ev.xkey, 0);
            /* Shift+F13 to unlock */
            if (ksym == XK_F13 && (ev.xkey.state & ShiftMask)) {
                break;
            }
        }
    }

    XUngrabKeyboard(dpy, CurrentTime);
    led_set(0);
    XCloseDisplay(dpy);
    return 0;
}

/* Cosole functions.
 * Printing, moving, etc.. (Moving the cursor is not yet implemented.
 */

#ifndef __CONSOLE_H__
#define __CONSOLE_H__

#include "types.h" /* We include types for the types. */

#define screen_width 120
#define screen_height 70
Uint8 *ram = (Uint8 *)0xB8000; /* Video ram */
Upoint2d cursor = {0,0};

enum Colors
  {
        color_black = 0x0,
	color_blue = 0x1,
	color_green = 0x2,
	color_cyan = 0x3,
	color_red = 0x4,
	color_magenta = 0x5,
	color_brown = 0x6,
	color_light_gray = 0x7,
	color_dark_gray = 0x8,
	color_light_blue = 0x9,
	color_light_green = 0xA,
	color_light_cyan = 0xB,
	color_light_red = 0xC,
	color_light_magenta = 0xD,
	color_yellow = 0xE,
	color_white = 0xF
  };


void clear_screen();
void print_string(string str,int8 color);
void update_cursor_y();
void print_char(char c,int8 color);

#include "console.c" /* We also include the `console.h' implementation. */

#endif /* console.h */
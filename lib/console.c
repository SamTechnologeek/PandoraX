/* console.h implementation */

#include <sys/console.h>

Uint8 *ram = (Uint8 *)0xB8000; /* Video ram */
Upoint2d cursor = {0,0};

void clear_screen()
{
  unsigned int i = 0;
  while(i<=screen_width*screen_height)
    {
      ram[i] = 0;
      i++;
    }
  cursor.x = 0;
  cursor.y = 0;
}

void print_string(string str, int8 color)
{
  int i;
  for(i=0;str[i]!=0;++i)
    {
      print_char(str[i],color);
    }
}

void print_char(char c, int8 color)
{
  unsigned int i = cursor.x+(screen_width*cursor.y);
  ram[i] = c;
  ram[i+1] = color;
  cursor.x = cursor.x+2;
  update_cursor_y();
}

void update_cursor_y() /* Used to update the Y coordinate of the cursor. */
{
  if(cursor.x/2>=screen_width)
    {
      cursor.y++;
      cursor.x = cursor.x - screen_width*2;
      update_cursor_y();
    }
}

void move_cursor(int x,int y)
{
  cursor.x = x*2;
  cursor.y = y*2;
}

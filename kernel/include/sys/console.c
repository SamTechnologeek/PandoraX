/* console.h implementation */

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
  unsigned int i = cursor.x+(screen_width*cursor.y);
  while(*str!=0)
    {
      /* if(i>=80) break; For debugging reasons */
      update_cursor_y();
      ram[i] = *str;
      str = str + 1;
      i++;
      ram[i] = color;
      i++;
      cursor.x = cursor.x + 2;
    }
}

void print_char(char c, int8 color)
{
  unsigned int i = cursor.x+(screen_width*cursor.y);
  ram[i] = c;
  ram[i+1] = color;
  cursor.x = cursor.x+2;
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

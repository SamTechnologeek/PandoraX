/* PandoraX operating system kernel. */
/* Started the 17th of July 2012     */

/* Developed by Samuel Domínguez */

#include <sys/console.h>
	    					
void greeting()
{
  print_string("Welcome to ",color_light_gray);
  print_string("Pandora",color_white);
  print_char('X',color_yellow);
  print_char('!',color_light_gray);
}

void kmain(void)
{
  clear_screen();
  greeting();
  while(1) {/* Nothing */}
 /* So the processor doesn't execute junk after this file */
}

#include <stdio.h>
int signal ()
{
  static int counter = 0;
  return ++counter;
}
int main(){
    for (int i = 0; i<10;++i)
    printf("%d\n", signal());
}
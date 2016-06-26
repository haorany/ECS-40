// Author: Sean Davis

#include <fstream>
#include <ctype.h>
#include <iostream>
#include <limits.h>
#include "utilities.h"

#define TEN 10
#define ASCII_ZERO '0'

using namespace std;

const int getNumber()
{
  long long number = 0, OK = 1;
  char c;
  
  for(c = cin.get(); isspace(c) && c != '\n'; c = cin.get());
  
  if(isdigit(c))
  {
    do
    {
      number = number * TEN + c - ASCII_ZERO;
      c = cin.get();
    }  while(isdigit(c) && number <= INT_MAX);
    
    while(c != '\n' && isspace(c))
      c = cin.get();
    
    if(c != '\n' || number > INT_MAX)
      OK = 0;
  }  // if first non-space is a digit
  else // first non-space is not a digit
    OK = 0;  // false
  
  while(c != '\n')
    c = cin.get();
  
  if(OK)
    return number;
  else  // invalid number
    return ERROR;
  
} // getNumber()
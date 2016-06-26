#ifndef FLIGHT_H
#define	FLIGHT_H

#include <iostream>
#include <fstream>
#include "plane.h"

#define MAX_CITY_LENGTH 20
#define BLANK 4
#define BLANKA 20

using namespace std;

class Flight
{
  int flightNum;
  char origin[MAX_CITY_LENGTH];
  char destination[MAX_CITY_LENGTH];
  Plane *plane;
public:
  void printFlightInfo() const;
  void addPassenger();
  int getFlightNumber() const;
  void readFlight(ifstream &inf);
  void writeFlight(ofstream &outf) const;
  ~Flight();
};  // Flight Class

#endif	// FLIGHT_H

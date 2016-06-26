// Author: Sean Davis

#include <fstream>
#include <iostream>
#include <iomanip>
#include <string.h>
#include "flight.h"

using namespace std;

void Flight::addPassenger()
{
  if(!plane->addPassenger())
    cout << "We are sorry but Flight #" << flightNum << " is full.\n";
  
}  // addPassenger()


Flight::~Flight()
{
  delete plane;
}  // freeFlight()


int Flight::getFlightNumber() const
{
  return flightNum;
}  // getFlightNumber()


void Flight::printFlightInfo() const
{
  cout << setw(BLANK) << left << flightNum << " "
    << setw(BLANKA) << left << origin << " "
    << destination << endl;
}  // printFlightInfo()


void Flight::readFlight(ifstream &inf)
{
  inf >> flightNum;
  inf.ignore();
  inf.getline(origin, MAX_CITY_LENGTH);
  inf.getline(destination, MAX_CITY_LENGTH);
  plane = new Plane(inf);
}  // readFlight()


void Flight::writeFlight(ofstream &outf) const
{
  outf << flightNum << "\n" << origin
    << "\n" << destination << "\n";
  plane->writePlane(outf);
}  // readFlight()

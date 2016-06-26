#ifndef PLANE_H
#define	PLANE_H

#include <iostream>
#include <fstream>

#define MAX_NAME_SIZE 80
#define FIRST_ROW 1
#define FIRST_SEAT 'A'

using namespace std;

class Plane
{
  int rows;
  int width;
  int reserved;
  char ***passengers;
  const int getRow();
  void showGrid() const;
public:
  int addPassenger();
  Plane(ifstream &inf);
  void writePlane(ofstream &outf) const;
  ~Plane();
};  // Plane Class

#endif	// PLANE_H

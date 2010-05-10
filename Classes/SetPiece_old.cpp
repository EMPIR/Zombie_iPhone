/*
 *  SetPiece.cpp
 *  ZombieGame
 *
 *  Created by David Guinnip on 4/28/10.
 *  Copyright 2010 ArchVision. All rights reserved.
 *
 */

#include "SetPiece.h"
#include <stdlib.h>
#include <string.h>


SetPiece::SetPiece()
{
	m_url = NULL;
	
}
SetPiece::~SetPiece()
{
	if(m_url != NULL)
		delete [] m_url;
	m_url = NULL;
}

bool SetPiece::operator==(const SetPiece &other) const {
    
	if(Color()	== other.Color() &&
	   Fill()	== other.Fill() &&
	   Shape()	== other.Shape() &&
	   Number() == other.Number())
		return true;
	return false;
}


int SetPiece::Color()
{
	return m_color;
}


int SetPiece::Fill()
{
	return m_fill;
}
int SetPiece::Shape()
{
	return m_shape;
}
int SetPiece::Number()
{
	return m_number;
}
int SetPiece::Index()
{
	return m_index;
}
char *SetPiece::URL()
{
	return m_url;
}

void SetPiece::setColor(int v)
{
	m_color = v;
}
void SetPiece::setFill(int v)
{
	m_fill = v;
}
void SetPiece::setShape(int v)
{
	m_shape = v;
}
void SetPiece::setNumber(int v)
{
	m_number = v;
}
void SetPiece::setIndex(int v)
{
	m_index = v;
}
void SetPiece::setURL(char *v)
{
	if(m_url != NULL)
		delete [] m_url;
	int len = strlen(v);
	m_url = new char[len];
	strcpy(m_url,v);
}


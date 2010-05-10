/*
 *  SetPiece.h
 *  ZombieGame
 *
 *  Created by David Guinnip on 4/28/10.
 *  Copyright 2010 ArchVision. All rights reserved.
 *
 */

class SetPiece {
public:
	
	enum ColorType
	{
		Red = 1,
		Green = 2,
		Blue = 3
	};
	
	
	enum FillType
	{
		Solid = 1,
		Hollow = 2,
		Striped = 3
	};
	
	enum ShapeType
	{
		Diamond = 1,
		Cylinder = 2,
		Squiggle = 3
	};
	
	enum NumberType
	{
		One = 1,
		Two = 2,
		Three = 3
	};
	
	
protected:	
	
	int m_color;
	int m_fill;
	int m_shape;
	int m_number;
	int m_index;
	char *m_url;
public:	
	SetPiece();
	virtual ~SetPiece();
	
	bool operator==(const SetPiece &other) const;	
	int Color();
	int Fill();
	int Shape();
	int Number();
	int Index();
	char *URL();
	
	void setColor(int);
	void setFill(int);
	void setShape(int);
	void setNumber(int);
	void setIndex(int);
	void setURL(char *);
	
};

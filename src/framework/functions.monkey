Import ld

Function RectOverRect:Bool(tX1:Float, tY1:Float, tW1:Float, tH1:Float, tX2:Float, tY2:Float, tW2:Float, tH2:Float)
	If tX2 > tX1 + tW1 Then Return False
	If tX1 > tX2 + tW2 Then Return False
	If tY2 > tY1 + tH1 Then Return False
	If tY1 > tY2 + tH2 Then Return False
	Return True
End

Function PointInRect:Bool(pX:Float, pY:Float, X1:Float, Y1:Float, W1:Float, H1:Float)
	If pX < X1 Then Return False
	If pX > X1 + W1 Then Return False
	If pY < Y1 Then Return False
	If pY > Y1 + H1 Then Return False
	Return True
End

Function SlideValue:Float(p1:Float, p2:Float, slideAmount:Float)
	Return p1 + ( (p2 - p1) * Clamp(slideAmount, 0.0, 1.0))
End

' Jesse - MonkeyCoder forums
Global FNC_DLWW_Coords:Float[] = New Float[8]
Function DrawLineWithWidth:Void(XPos:Float, YPos:Float, XPos2:Float, YPos2:Float, Thickness:Float = 3, roundedEnds:Int = False)
	Local vx:Float = XPos2 - XPos
	Local vy:Float = YPos2 - YPos
	Local Angle:Float=ATan2(vy,vx)
	Local c:Float = Cos(Angle)
	Local s:Float = Sin(Angle)
	Local LineLength:Float = c*vx+s*vy
	Local cl:Float = LineLength*c
	Local sl:Float = LineLength*s
	Local r:Float = Thickness/2.0
	Local sr:Float = s*r
	Local cr:Float = c*r
	'Left Top Coords
	FNC_DLWW_Coords[0] = XPos + sr
	FNC_DLWW_Coords[1] = YPos - cr
	'Right Top Coords
	FNC_DLWW_Coords[2] = cl + XPos + sr
	FNC_DLWW_Coords[3] = sl + YPos - cr
	'Right Down Coords
	FNC_DLWW_Coords[4] = cl - sr + XPos
	FNC_DLWW_Coords[5] = sl + cr + YPos
	'Left Down Coords
	FNC_DLWW_Coords[6] = XPos - sr
	FNC_DLWW_Coords[7] = YPos + cr
	DrawPoly(FNC_DLWW_Coords)
	If roundedEnds = True	
		DrawCircle(XPos,YPos,r)
		DrawCircle(XPos2,YPos2,r)
	Endif
End Function

' Warpy - Blitzbasic forum
Global FNC_LOR_iy:Float
Global FNC_LOR_ix:Float
Function LineOverRect:Bool(last_x:Float, last_y:Float, x:Float, y:Float, bx1:Float, by1:Float, bx2:Float, by2:Float)
	'finds point of intersection of line from (last_x,last_y) to (x,y)
	'with the box (bx1,by1,bx2,by2). the ix and iy parameters are var pointers, which means
	'the function fills in the values of the point of intersection in the variables that you give.
	'the function also returns true if there is an intersection, and false if there is none.
	
	If Not (x>=bx1 And x<=bx2 And y>=by1 And y<=by2) Return False
	
	If last_x < bx1 And x >= bx1 		'does it cross left edge?
		FNC_LOR_iy = last_y + (y - last_y) * (bx1 - last_x) / (x - last_x)
		If FNC_LOR_iy >= by1 And FNC_LOR_iy <= by2			'is intersection point on left edge?
			FNC_LOR_ix = bx1
			Return True
		EndIf
	ElseIf last_x > bx2 And x <= bx2	'does it cross right edge?
		FNC_LOR_iy = last_y + (y - last_y) * (bx2 - last_x) / (x - last_x)
		If FNC_LOR_iy >= by1 And FNC_LOR_iy <= by2			'is intersection point on right edge?
			FNC_LOR_ix = bx2
			Return True
		EndIf
	EndIf
	
	If last_y < by1 And y >= by1 		'does it cross top edge?
		FNC_LOR_ix = last_x + (x - last_x) * (by1 - last_y) / (y - last_y)
		If FNC_LOR_ix >= bx1 And FNC_LOR_ix <= bx2			'is intersection point on top edge?
			FNC_LOR_iy = by1
			Return True
		EndIf
	ElseIf last_y > by2 And y <= by2	'does it cross bottom edge?
		FNC_LOR_ix = last_x + (x - last_x) * (by2 - last_y) / (y - last_y)
		If FNC_LOR_ix >= bx1 And FNC_LOR_ix <= bx2			'is intersection point on bottom edge?
			FNC_LOR_iy = by2
			Return True
		EndIf
	EndIf
	
	Return False
	
End

Function CircleOverCircle:Float(cX1:Float, cY1:Float, cR1:Float, cX2:Float, cY2:Float, cR2:Float)
	Local checkDistance:Float = cR1 + cR1
	Local dX:Float = Abs(cX2 - cX1)
	Local dY:Float = Abs(cY2 - cY1)
	' Under the assumption that more often than not, circles won't even be remotely close
	' We just check the dX and dY values because CPU wise it's much quicker
	If dX > checkDistance Then Return False
	If dY > checkDistance Then Return False
	Local actualDistance:Float = Sqrt( (dX * dX) + (dY * dY))
	If actualDistance <= checkDistance Then Return True
	
	Return False
End


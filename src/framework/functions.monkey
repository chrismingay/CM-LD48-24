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
	Local vx:Float = Xpos2 - Xpos
	Local vy:Float = Ypos2 - Ypos
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
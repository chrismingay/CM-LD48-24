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
	Return p1 + ( (p2 - p1) * Clamp(slideAmount,0.0,1.0))
End
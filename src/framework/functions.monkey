Import ld

Function RectOverRect:Bool(tX1:Float, tY1:Float, tW1:Float, tH1:Float, tX2:Float, tY2:Float, tW2:Float, tH2:Float)
	If tX2 > tX1 + tW1 Then Return False
	If tX1 > tX2 + tW2 Then Return False
	If tY2 > tY1 + tH1 Then Return False
	If tY1 > tY2 + tH2 Then Return False
	Return True
End
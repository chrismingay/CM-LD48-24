Import ld

Class Camera

	Global X:Float,Y:Float,TargetX:Float,TargetY:Float
	Global MinX:Float,MinY:Float,MaxX:Float,MaxY:Float
	Global Responsiveness:Float
	
	Global Zoom:Float,TargetZoom:Float
	Global MinZoom:Float,MaxZoom:Float
	Global ZoomResponsiveness:Float
	
	Global ResolutionWidth:Int
	Global ResolutionHeight:Int
	
	Function Init:Void()
		SetPositionBounds(-1000,-1000,2000,2000)
		SetPosition(0,0)
		SetResponsiveness(0.1)
		
		SetZoomBounds(0.5,2.0)
		SetZoom(1.0)
		SetZoomResponsiveness(0.1)
		
		SetResolution(AppWidth, AppHeight)
	End
	
	Function Update:Void()
		X = SlideValue(X, TargetX, Responsiveness)
		Y = SlideValue(Y, TargetY, Responsiveness)
		Zoom = SlideValue(Zoom, TargetZoom, ZoomResponsiveness)
	End
	
	' POSITION FUNCTIONS
	Function SetTargetPosition:Void(tX:Float, tY:Float)
		TargetX = Clamp(tX,MinX,MaxX - (ResolutionWidth * Zoom))
		TargetY = Clamp(tY,MinY,MaxY - (ResolutionHeight * Zoom))
	End
	
	Function SetPosition:Void(tX:Float, tY:Float)
		X = Clamp(X,MinX,MaxX - (ResolutionWidth * Zoom))
		Y = Clamp(Y,MinY,MaxY - (ResolutionHeight * Zoom))
		TargetX = X
		TargetY = Y
	End
	
	Function SetResponsiveness:Void(tR:Float)
		Responsiveness = Clamp(tR,0.01,1.0)
	End
	
	Function SetResolution:Void(tW:Int, tH:Int)
		ResolutionWidth = tW
		ResolutionHeight = tH
	End
	
	Function SetPositionBounds:Void(X1:Float, Y1:Float, X2:Float, Y2:Float)
		MinX = X1
		MaxX = X2
		MinY = Y1
		MaxY = Y2
		
		' We refresh the position to consider the new bounds
		SetPosition(X,Y)
		
	End
	
	Function Move:Void(dX:Float, dY:Float)
		SetTargetPosition(TargetX + dX,TargetY + dY)
	End
	
	' ZOOM FUNCTIONS
	Function SetTargetZoom:Void(tZ:Float)
		TargetZoom = Clamp(tZ,MinZoom,MaxZoom)
	End
	
	Function SetZoom:Void(tZ:Float)
		Zoom = Clamp(tZ,MinZoom,MaxZoom)
		TargetZoom = Zoom
	End
	
	Function SetZoomResponsiveness:Void(tZ:Float)
		ZoomResponsiveness = Clamp(tZ,0.01,1.0)
	End
	
	Function SetZoomBounds:Void(Z1:Float, Z2:Float)
		MinZoom = Z1
		MaxZoom = Z2
		
		' We refrech the zoom to consider the new bounds
		SetZoom(Zoom)
	End
	
	Function AdjustZoom:Void(dZ:Float)
		SetTargetZoom(TargetZoom + dZ)
	End
	
	' DRAW FUNCTIONS
	Function CamDrawImage:Void(image:TImage, tX:Float, tY:Float, tR:Float = 0.0, tXS:Float = 1.0, tYS:Float = 1.0)
		'SetRotation(tR)
		'SetScale(tXS * Zoom,tYS * Zoom)
		DrawImage(image, (tX - X) * Zoom, (tY - Y) * Zoom, tR, tXS * Zoom, tYS * Zoom)
	End
	
	Function CamDrawLine:Void(tX1:Float, tY1:Float, tX2:Float, tY2:Float, tThickness:Float = 1.0)
		'SetRotation(0)
		'SetScale(1,1)
		'SetLineWidth(tThickness * Zoom)
		DrawLineWithWidth( (tX1 - X) * Zoom, (tY1 - Y) * Zoom, (tX2 - X) * Zoom, (tY2 - Y) * Zoom, tThickness * Zoom, True)
		'DrawThickLine((tX1 - X) * Zoom,(tY1 - Y) * Zoom,(tX2 - X) * Zoom,(tY2 - Y) * Zoom,tThickness)
	End

End

Import ld

Class GameScreen Extends Screen

	Method OnScreenStart:Void()
		Camera.Init()
	End

	Method Update:Void()
		If KeyHit(KEY_SPACE)
			Camera.SetTargetZoom(Rnd(0.5, 2.0))
			'Camera.SetTargetPosition(Rnd(0.0, 100.0), Rnd(0.0, 100.0))
		EndIf
		
		Camera.Update()
	End
	
	Method Render:Void()
		DrawText("Game Screen", 10, 10)
		Camera.CamDrawLine(3, 3, 80, 80, 2)
		
	End

End
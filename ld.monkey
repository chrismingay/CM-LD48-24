Strict

Import mojo

Import src.framework.camera
Import src.framework.functions
Import src.framework.gfx
Import src.framework.rect
Import src.framework.raztext
Import src.framework.screen
Import src.framework.screenmanager
Import src.framework.sfx

Import src.screens.credits
Import src.screens.exitapp
Import src.screens.game
Import src.screens.howtoplay
Import src.screens.logo
Import src.screens.title

Global AppWidth:Int = 800
Global AppHeight:Int = 600


Class LDApp Extends App
	
	Method OnCreate:Int()
		
		GFX.Init()
		ScreenManager.Init()
		SFX.Init()
		
		' Add the graphics
		' Use C:\Apps\Aseprite\
		
		' Initialize the fonts
		RazText.SetTextSheet(LoadImage("gfx/fonts.png"))
		
		' Add the screens
		ScreenManager.AddScreen("credits", New CreditsScreen())
		ScreenManager.AddScreen("exit", New ExitScreen())
		ScreenManager.AddScreen("game", New GameScreen())
		ScreenManager.AddScreen("howtoplay", New HowToPlayScreen())
		ScreenManager.AddScreen("logo", New LogoScreen())
		ScreenManager.AddScreen("title", New TitleScreen())
		
		
		' Add the sound effects
		' USE C:\Apps\sfxr\
		
		' Add the music
		' USE C:\Apps\MusicGen\
		
		' Set the initial screen details
		ScreenManager.SetFadeColour(255, 255, 255)
		ScreenManager.SetFadeRate(0.01)
		ScreenManager.SetScreen("logo")
		
		SetUpdateRate(60)
		
		Return 0
	End
	
	Method OnUpdate:Int()
	
		Local ScreenChanged:Bool = False
		If KeyHit(KEY_1)
			ScreenManager.ChangeScreen("logo")
			ScreenChanged = True
		EndIf
		
		If KeyHit(KEY_2)
			ScreenManager.ChangeScreen("title")
			ScreenChanged = True
		EndIf
		
		If KeyHit(KEY_3)
			ScreenManager.ChangeScreen("game")
			ScreenChanged = True
		EndIf
		
		If KeyHit(KEY_4)
			ScreenManager.ChangeScreen("credits")
			ScreenChanged = True
		EndIf
		
		If KeyHit(KEY_5)
			ScreenManager.ChangeScreen("exit")
			ScreenChanged = True
		EndIf
		
		If KeyHit(KEY_6)
			ScreenManager.ChangeScreen("howtoplay")
			ScreenChanged = True
		EndIf
		
		If ScreenChanged = True
			ScreenManager.SetFadeRate(Rnd(0.0, 1.0))
			ScreenManager.SetFadeColour(Rnd(0.0, 255.0), Rnd(0.0, 255.0), Rnd(0.0, 255.0))
		EndIf
	
		ScreenManager.Update()
		Return 0
	End
	
	Method OnRender:Int()
		Cls
		ScreenManager.Render()
		Return 0
	End

End

Function Main:Int()
	New LDApp
	Return 0
End

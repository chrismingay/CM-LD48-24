Import ld

Class SFX

	Global Musics:StringMap<String>
	Global Sounds:StringMap<Sound>
	Const CHANNELS:Int = 8
	Global ActiveChannel:Int
	
	Global SoundVolume:Float = 1.0
	Global MusicVolume:Float = 1.0

	Function Init:Void()
		ActiveChannel = 0
		Sounds = New StringMap<Sound>
		Musics = New StringMap<String>
	End
	
	Function Add:Void(tName:String, tFile:String)
		Local tSound:Sound = LoadSound("sfx/" + tFile)
		If tSound <> Null
			Sounds.Set(tName, tSound)
		Else
			Error "File " + tFile + " doesn't appear to exist"
		EndIf
	End
	
	Function AddMusic:Void(tName:String, tFile:String)
		Musics.Set(tName, tFile)
	End
	
	Function Play:Void(tName:String, tVol:Float = 1.0, tPan:Float = 0.0, tRate:Float = 1.0)
	
		tVol = Clamp(tVol, 0.0, 1.0)
		if tVol = 0
			Return
		EndIf
		
		If Not Sounds.Contains(tName)
			Error "Sound " + tName + " doesn't appear to exist"
		EndIf
		
		SetChannelVolume(ActiveChannel, tVol * SoundVolume)
		SetChannelPan(ActiveChannel, Clamp(tPan, -1.0, 1.0))
		SetChannelRate(ActiveChannel, Clamp(tRate, 0.5, 2.0))
		
		PlaySound(Sounds.Get(tName), ActiveChannel)
		
		UpdateChannel()
		
	End
	
	Function UpdateChannel:Void()
		ActiveChannel += 1
		If ActiveChannel = CHANNELS
			ActiveChannel = 0
		EndIf
	End
	
	Function Music:Void(tMus:String, tLoop:Int = 1)
		If Not Musics.Contains(tMus)
			Error "Music " + tMus + " does not appear to exist"
		EndIf
		PlayMusic("mus/" + Musics.Get("tMus"), tLoop)
	End
	
	Function SetGlobalSoundVolume:Void(tVol:Float)
		SoundVolume = Clamp(tVol, 0.0, 1.0)
	End
	
	Function SetGlobalMusicVolume:Void(tVol:Float)
		MusicVolume = Clamp(tVol, 0.0, 1.0)
		SetMusicVolume(MusicVolume)
	End
	
	Function ChangeGlobalSoundVolume:Void(dVol:Float)
		SetGlobalSoundVolume(SoundVolume + dVol)
	End
	
	Function ChangeGlobalMusicVolume:Void(dVol:Float)
		SetGlobalMusicVolume(MusicVolume + dVol)
	End
	
	


End
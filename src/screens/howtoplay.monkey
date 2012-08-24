Import ld

Class HowToPlayScreen Extends Screen

	Field HowToPlayText:RazText
	
	Method New()
		HowToPlayText = New RazText()
		HowToPlayText.AddMutliLines(LoadString("txt/howtoplay.txt"))
	End
	
	Method Render:Void()
		DrawText("Logo Screen", 10, 10)
		HowToPlayText.Draw(10,30)
	End

End
Import ld

Class CreditsScreen Extends Screen

	Field CreditText:RazText

	Method New()
		CreditText = New RazText()
		CreditText.AddMutliLines(LoadString("txt/credits.txt"))
	End
	
	Method Render:Void()
		Cls(128,128,128)
		DrawText("Credits", 10, 10)
		CreditText.Draw(10, 30)
	End

End
counterfile := "Counts/DeathCount.txt"
counter := 0

if FileExist(counterFile)
    FileRead, counter, %counterFile%
else
    FileAppend, %counter%, %counterFile%

Gui, Color, Black
Gui +LastFound  ; 
WinSet, TransColor, Black
Gui -Caption  ; 
Gui +AlwaysOnTop 
Gui, Font, s30, PricedownBl-Regular, w1000
Gui, Add, Text, vcounter cWhite w10000, Deaths: %counter%
Gui, Show, x0 y410 NoActivate

~Ins::
	counter := counter + 1
	GuiControl,,counter,  Deaths: %counter%
	FileDelete, %counterFile%
    FileAppend, %counter%, %counterFile%
return

~Del::   
	counter := counter - 1
	GuiControl,,counter, Deaths: %counter%
	FileDelete, %counterFile%
    FileAppend, %counter%, %counterFile%
return

GuiClose:
	ExitApp
return
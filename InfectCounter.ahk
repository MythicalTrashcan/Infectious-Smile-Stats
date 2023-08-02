counterfile := "Counts/InfectCount.txt"
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
Gui, Add, Text, vcounter cWhite w10000, Humans Infected: %counter%
Gui, Show, x0 y360 NoActivate

~Home::
	counter := counter + 1
	GuiControl,,counter, Humans Infected: %counter%
	FileDelete, %counterFile%
    FileAppend, %counter%, %counterFile%
return

~End::   
	counter := counter - 1
	GuiControl,,counter, Humans Infected: %counter%
	FileDelete, %counterFile%
    FileAppend, %counter%, %counterFile%
return

GuiClose:
	ExitApp
return
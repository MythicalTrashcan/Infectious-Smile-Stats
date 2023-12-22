counterFile := "Counts/KillCount.txt"
counter := 0

if FileExist(counterFile)
    FileRead, counter, %counterFile%
else
	FileCreateDir Counts
	File := FileOpen(counterFile, "w")
	File.Write(counter)
	File.Close()

Gui, Color, Black
Gui +LastFound  ; 
WinSet, TransColor, Black
Gui -Caption  ; 
Gui +AlwaysOnTop 
Gui, Font, s30, PricedownBl-Regular, w1000
Gui, Add, Text, vcounter cWhite w10000, Smilers Killed: %counter%
Gui, Show, x0 y310 NoActivate

~PgUp::
	counter := counter + 1
	GuiControl,,counter, Smilers Killed: %counter%
	FileDelete, %counterFile%
    FileAppend, %counter%, %counterFile%
return

~PgDn::   
	counter := counter - 1
	GuiControl,,counter, Smilers Killed: %counter%
	FileDelete, %counterFile%
    FileAppend, %counter%, %counterFile%
return

GuiClose:
	ExitApp
return
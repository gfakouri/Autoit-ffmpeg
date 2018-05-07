#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\garet\Documents\autoid_ffmpeg\ffmpeg.kxf
Global $ffmpegConverter = GUICreate("ffmpeg Converter", 615, 437, -1, -1)
Global $locationInput = GUICtrlCreateInput("", 48, 40, 521, 21)
Global $fileIinput = GUICtrlCreateInput("", 48, 104, 521, 21)
Global $convertButton = GUICtrlCreateButton("Convert File to .mp4", 184, 376, 115, 25)
Global $exitButton = GUICtrlCreateButton("Exit", 352, 376, 75, 25)
Global $locationLabel = GUICtrlCreateLabel("Please input the location of the file you wish to convert.", 48, 8, 264, 17)
Global $fileLabel = GUICtrlCreateLabel("Please enter the name of the file you wish to convert.", 48, 72, 254, 17)
Global $newFileInput = GUICtrlCreateInput("", 48, 168, 521, 21)
Global $outputLabel = GUICtrlCreateLabel("Please enter the output name of the file : Please denote it with a .mp4 designation.", 48, 136, 391, 17)
Global $volumeLabel = GUICtrlCreateLabel("Filter to increase volume of converted file.", 48, 200, 200, 17)
;Global $volumeGroup = GUICtrlCreateGroup("", 48, 224, 185, 49)
Global $x1Radio = GUICtrlCreateRadio("X 1", 64, 240, 41, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $x2Radio = GUICtrlCreateRadio("X 2", 120, 240, 41, 17)
Global $x3Radio = GUICtrlCreateRadio("X 3", 176, 240, 41, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)



GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $convertButton
			$locationData = GUICtrlRead($locationInput)
			$fileData = GUICtrlRead($fileIinput)
			$finalFileData = GUICtrlRead($newFileInput)

			If GUICtrlRead($x1Radio) = 1 Then

				Run("C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe", "", @SW_SHOWDEFAULT)

				WinWaitActive("Windows PowerShell", "", 1500)
				Sleep(1000)
				ControlSend("Windows PowerShell", "", "", "cd\")
				Sleep(1000)
				Send("{Enter}")
				ControlSend("Windows PowerShell", "", "", "ls")
				Sleep(1000)
				Send("{Enter}")
				ControlSend("Windows PowerShell", "", "", "cd " & $locationData)
				Sleep(1000)
				Send("{Enter}")
				ControlSend("Windows PowerShell", "", "", "ls")
				Sleep(1000)
				Send("{Enter}")
				ControlSend("Windows PowerShell", "", "", "ffmpeg -i " & $fileData & " " & $finalFileData)
				Sleep(1000)
				Send("{Enter}")

			ElseIf GUICtrlRead($x2Radio) = 1 Then

				MsgBox(1, "Double Volume.", "This will double the volume.")

				Run("C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe", "", @SW_SHOWDEFAULT)

				WinWaitActive("Windows PowerShell", "", 1500)
				Sleep(1000)
				ControlSend("Windows PowerShell", "", "", "cd\")
				Sleep(1000)
				Send("{Enter}")
				ControlSend("Windows PowerShell", "", "", "ls")
				Sleep(1000)
				Send("{Enter}")
				ControlSend("Windows PowerShell", "", "", "cd " & $locationData)
				Sleep(1000)
				Send("{Enter}")
				ControlSend("Windows PowerShell", "", "", "ls")
				Sleep(1000)
				Send("{Enter}")
				ControlSend("Windows PowerShell", "", "", "ffmpeg -i " & $fileData & ' -filter:a "volume=2 " ' & $finalFileData)
				Sleep(1000)
				Send("{Enter}")

				ElseIf GUICtrlRead($x3Radio) = 1 Then

					MsgBox(1, "Double Volume.", "This will double the volume.")

					Run("C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe", "", @SW_SHOWDEFAULT)

					WinWaitActive("Windows PowerShell", "", 1500)
					Sleep(1000)
					ControlSend("Windows PowerShell", "", "", "cd\")
					Sleep(1000)
					Send("{Enter}")
					ControlSend("Windows PowerShell", "", "", "ls")
					Sleep(1000)
					Send("{Enter}")
					ControlSend("Windows PowerShell", "", "", "cd " & $locationData)
					Sleep(1000)
					Send("{Enter}")
					ControlSend("Windows PowerShell", "", "", "ls")
					Sleep(1000)
					Send("{Enter}")
					ControlSend("Windows PowerShell", "", "", "ffmpeg -i " & $fileData & ' -filter:a "volume=3 " ' & $finalFileData)
					Sleep(1000)
					Send("{Enter}")

			EndIf

		Case $exitButton

			Exit

	EndSwitch
WEnd

-- LaunchBar: 入力した文字列を、claude が動いている Terminal のタブに送る
on handle_string(s)
	tell application "Terminal"
		repeat with w in windows
			try
				set t to selected tab of w
				if (processes of t) contains "claude" then
					do script s in t
					return
				end if
			end try
		end repeat
	end tell
	display notification "claude が動いているタブが見つかりません" with title "Send to Claude"
end handle_string

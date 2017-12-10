On Error Resume Next
Const HKEY_CURRENT_USER = &H80000001
strComputer = "."                        ' for localhost
sitename = "cadweb.fire.ca.gov"
Set objReg = GetObject("winmgmts:" & "{impersonationLevel=impersonate}\\" & strComputer & "\root\default:StdRegProv")
strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" _
               & "ZoneMap\Domains\" & sitename
objReg.CreateKey HKEY_CURRENT_USER,strKeyPath
strValueName = "https"
dwValue = 2
objReg.SetDWORDValue HKEY_CURRENT_USER,strKeyPath,strValueName,dwValue
wscript.echo "You have successfully added " & vbcrlf & _ 
              sitename & " to IE Trusted Sites List"
sitename = "caditsint1"
Set objReg = GetObject("winmgmts:" & "{impersonationLevel=impersonate}\\" & strComputer & "\root\default:StdRegProv")
strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" _
               & "ZoneMap\Domains\" & sitename
objReg.CreateKey HKEY_CURRENT_USER,strKeyPath
strValueName = "https"
dwValue = 2
objReg.SetDWORDValue HKEY_CURRENT_USER,strKeyPath,strValueName,dwValue
wscript.echo "You have successfully added " & vbcrlf & _ 
              sitename & " to IE Trusted Sites List"
SiteName = "caditsint1"
Set objRegistry=GetObject("winmgmts:\\" & _  
    strComputer & "\root\default:StdRegProv") 
strKeyPath = "Software\Microsoft\Internet Explorer\New Windows\Allow\" 
objRegistry.CreateKey HKEY_CURRENT_USER, strKeyPath 
arrValues = Array() 
objRegistry.SetBinaryValue HKEY_CURRENT_USER, strKeyPath, SiteName, arrValues 
wscript.echo "You have successfully added " & vbcrlf & _ 
              SiteName & " to IE Popup Blocker"
SiteName = "calatersapp.sco.ca.gov"
Set objRegistry=GetObject("winmgmts:\\" & _  
    strComputer & "\root\default:StdRegProv") 
strKeyPath = "Software\Microsoft\Internet Explorer\New Windows\Allow\" 
objRegistry.CreateKey HKEY_CURRENT_USER, strKeyPath 
arrValues = Array() 
objRegistry.SetBinaryValue HKEY_CURRENT_USER, strKeyPath, SiteName, arrValues 
wscript.echo "You have successfully added " & vbcrlf & _ 
              SiteName & " to IE Popup Blocker"
SiteName = "*.ca.gov"
Set objRegistry=GetObject("winmgmts:\\" & _  
    strComputer & "\root\default:StdRegProv") 
strKeyPath = "Software\Microsoft\Internet Explorer\New Windows\Allow\" 
objRegistry.CreateKey HKEY_CURRENT_USER, strKeyPath 
arrValues = Array() 
objRegistry.SetBinaryValue HKEY_CURRENT_USER, strKeyPath, SiteName, arrValues 
wscript.echo "You have successfully added " & vbcrlf & _ 
              SiteName & " to IE Popup Blocker"
$L = "C:/requested log/$F"
$S = 'C:/requested log/'
$F = "log." + (Get-DateTime)
beginning{
 function Get-Logfile {
  if (Get-ChildItem -path $L is  ) {
        pass
  }
 }

 function New-Logfile {
  try{
   New-PSObject -file -path $S -name $F
  }
  catch{ 
  }
 }

 function New-Directory {
  try{
   New-PSObject -directory -path  $S
  }
  catch{
  }

 function Write-ToLog{
  $PSItem | out-file.append -path $L
 }

 function Build-LogFile{
  New-Directory,
  New-LogFile
 }
  Build-LogFile
 }
}

foreach (PSObject in $PSItem ){
  Get-Logfile 
  Write-ToLog 
}

end{
 Write-Out "You can find your log file at ($L)"
}

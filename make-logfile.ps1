$L = "C:/requested log/$F"
$S = 'C:/requested log/'
$F = "log." + (Get-DateTime)

function New-EliLog {
  [CmdletBinding(PositionalBinding=$false,ConfirmImpact='low')]
  [Alias(mylog)]
  Param
  (
      # Param1 help description
      [Parameter(Mandatory=$true, 
                 ValueFromPipeline=$true,
                 ValueFromPipelineByPropertyName=$true, 
                 ValueFromRemainingArguments=$false, 
                 Position=0,
                 ParameterSetName='Parameter Set 1')]
      [ValidateNotNull()]
      [ValidateNotNullOrEmpty()]
      [ValidateCount(0,5)]
      [ValidateSet("sun", "moon", "earth")]
      [Alias("p1")] 
      $Param1,

      # Param2 help description
      [Parameter(ParameterSetName='Parameter Set 1')]
      [AllowNull()]
      [AllowEmptyCollection()]
      [AllowEmptyString()]
      [ValidateScript({$true})]
      [ValidateRange(0,5)]
      [int]
      $Param2,

      # Param3 help description
      [Parameter(ParameterSetName='Another Parameter Set')]
      [ValidatePattern("[a-z]*")]
      [ValidateLength(0,15)]
      [String]
      $Param3
  )

}
  function Get-Logfile {Get-ChildItem -path $L}

  function New-Logfile {
    try{
     New-PSObject -file -path $S -name $F
    }
      catch{ 
      }
  }

  function New-Directory {
   try{
    New-PSObject -directory $S
   }
   catch{
   }
  }
  function Write-ToLog{
   $PSItem | out-file.append -path $L
  }

  function Build-LogFile{
   New-Directory
   New-LogFile
  }
 foreach ($PSObject in $PSItem ){
  Get-Logfile 
  Write-ToLog 
 }

Write-Out "You can find your log file at ($L)"
}
﻿#PSD Helper
Param(
    $MDTDeploySharePath,
    $UserName,
    $Password
)

#Connect
& net use $MDTDeploySharePath $Password /USER:$UserName

# Set the module path based on the current script path
$deployRoot = Split-Path -Path "$PSScriptRoot"
$env:PSModulePath = $env:PSModulePath + ";$deployRoot\Tools\Modules"


#Import Env
Import-Module Microsoft.BDD.TaskSequenceModule -Scope Global -Force -Verbose
Import-Module PSDUtility -Force -Verbose -Scope Global
Import-Module PSDDeploymentShare -Force -Verbose -Scope Global
Import-Module PSDGather -Force -Verbose -Scope Global

dir tsenv: | Out-File "$($env:SystemDrive)\PSDDumpVars.log"
Get-Content -Path "$($env:SystemDrive)\PSDDumpVars.log"


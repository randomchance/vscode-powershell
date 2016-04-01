function Invoke-MyCommand {
    Write-Output "My command's function was executed!"
}

Register-EditorExtension -Verbose `
   -Command `
   -Name "MyModule.MyCommandWithFunction" `
   -DisplayName "My command with function" `
   -Function Invoke-MyCommand

Register-EditorExtension -Verbose `
   -Command `
   -Name "MyModule.MyCommandWithScriptBlock" `
   -DisplayName "My command with script block" `
   -ScriptBlock { Write-Output "My command's script block was executed!" }


function Invoke-MyEdit([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context) {
    #$context.CurrentFile.InsertText("", $context.CurrentFile.FileRange);

#     $range = New-Object -TypeName Microsoft.PowerShell.EditorServices.BufferRange -ArgumentList @(24, 1, 24, 1)
    $context.CurrentFile.InsertText(
        "`r`nFormat-Volume -DriveLetter C -Confirm`r`n",
        $context.CursorPosition);
        #$range);
}

Register-EditorExtension -Verbose `
   -Command `
   -Name "MyModule.MyEditCommand" `
   -DisplayName "Apply my edit!" `
   -Function Invoke-MyEdit

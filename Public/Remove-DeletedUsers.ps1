function Remove-DeletedUsers
{
    <#
    .SYNOPSIS
    Permanently removes deleted MSOL users.
    
    .DESCRIPTION
    Permanently removes accounts using the -Force switch.
    
    .EXAMPLE
    Remove-DeletedUsers
    #>
    [CmdletBinding()]
    Param()

    try 
    {
        Get-MsolUser -ReturnDeletedUsers | Remove-MsolUser -RemoveFromRecycleBin -Force
    }
    catch 
    {
        throw "Error running script" 
    }

}
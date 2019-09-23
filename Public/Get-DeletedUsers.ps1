function Get-DeletedUsers
{
    <#
    .SYNOPSIS
    Returns Deleted MSOL Users.
    
    .DESCRIPTION
    Returns all deleted MSOL Users to the console.
    
    .EXAMPLE
    Get-DeletedUsers
    #>
    [CmdletBinding()]
    Param()
    
    try 
    {
        Get-MsolUser -ReturnDeletedUsers | Write-Output
    }
    catch 
    {
        throw "Error running script"   
    }
}
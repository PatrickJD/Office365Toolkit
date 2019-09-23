function Set-MassOutOfOffice
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
    Param
    (
        [parameter(mandatory=$True,position=0)]
        [String]
        $Users,
        [parameter(mandatory=$True,position=1)]
        [String]
        $ExternalMessage,
        [parameter(mandatory=$True,position=2)]
        [String]
        $InternalMessage
    )
   
    foreach ($User in $Users)
    {
        try
        {
            Set-MailboxAutoReplyConfiguration -Identity $($User.Mailbox) -AutoReplyState Enabled -ExternalMessage $ExternalMessage -InternalMessage $InternalMessage
            Write-Host "Set out of office messages for user $User"
            Write-Output "Set out of office messages for user $User" | Out-File MassOutOfOffice.log -Append
        }
        catch
        {
            Write-Error "An error has occured setting the out of office message for user $User"
            Write-Error "An error has occured setting the out of office message for user $User" | Out-File MassOutOfOffice.log -Append
        }
    }

}
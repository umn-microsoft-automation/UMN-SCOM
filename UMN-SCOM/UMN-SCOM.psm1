    ###
# Copyright 2017 University of Minnesota, Office of Information Technology

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
###

#region Dependancies
Function Restart-SCOMHealth
{
    param(
    [Parameter(madatory=$true)]$HostName
    )
    [CmdletBinding(SupportsShouldProcess=$true)]
    try
    {
        Get-Service -Name "HealthService" -ComputerName $HostName | Stop-Service
        Start-Sleep -Seconds 5
        if((Get-Service -Name "HealthService" -ComputerName $HostName).Status -ne "Running")
        {
            Invoke-Command -ComputerName $HostName -ScriptBlock {Remove-Item -Path "C:\Program Files\Microsoft Monitoring Agent\Agent\Health Service State\Health Service Store\" -Recurse -Force} 
            Start-Sleep -Seconds 5
        }
        Get-Service -Name "HealthService" -ComputerName $HostName | Start-Service
    }
    catch
    {
        if((Get-Service -Name "HealthService" -ComputerName $HostName).Status -ne "Running")
        {
            Write-Verbose "Error Running Script Occured!, Service is not running, Check Manually"
        }
        else 
        {
            Write-Verbose "Error Running Script Occured!"
        }
        
    }
}

Export-ModuleMember -Function *
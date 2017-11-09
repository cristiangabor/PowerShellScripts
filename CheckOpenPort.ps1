$portrange = 1..65535
$ipaddress = $(ipconfig | where {$_ -match 'IPv4.+\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' } | out-null; $Matches[1])
$timeout_ms = 5



Get-Date


 if(Test-Connection -BufferSize 32 -Count 1 -Quiet -ComputerName $ipaddress){
    Write-Host "IP $ip is alive...."
    

    foreach($port in $portrange){
        $ErrorActionPreference = 'SilentlyContinue'
        $socket = new-object System.Net.Scokets.TcpClinet
        $connect = $socket.BeginConnect($ipaddress, $port, $null, $null)
        $tryconnect = Measure-Command { Success = $connect.AsyncWaitHandle.WaitOne($timeout_ms, $true) } | % totalmilliseconds
        $tryconnect | Out-Null
        
        if($socket.connected){
            Write-Host "{0}  is listenning on port {1}  (Response Time: {2} ms)" -F $ippaddress, $port, $tryconnect
            $socket.Close()
            $socket.Dispose()
            $socket = $null

        }
        else{
            wirte-host "no"
        }



        $ErrorActionPreference = 'Continue'


        
        } 
}

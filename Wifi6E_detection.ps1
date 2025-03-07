
# This script check if your network card support WiFi 6E checking Driver description and if so
# check if preferend band is in 6GHz.

# Writte: Antonio Tudela 



[int]$WiFi_E6_True=0

$Interfaces = Get-NetAdapter | Select-Object * 




foreach ($Interface in $Interfaces) { 

                                         

                                         $Network_Name = $Interface.Name
                                         $Network_Card = Get-NetAdapter -Name $Network_Name | Select-Object * -ErrorAction SilentlyContinue
                                         
                                                                         
                                         if ($interface.DriverDescription -match "6E" -or $interface.DriverDescription -match "7" ) { 
                                         write-host "$Network_Name support Wi-Fi 6E"
                                         
                                         $Preffered_Band = Get-NetAdapterAdvancedProperty -Name $Network_Name -DisplayName "Preferred Band"

                                                                                                                                     if ($Preffered_Band.DisplayValue -notmatch "4. 6G first" -or $Preffered_Band.DisplayValue -notmatch "4. Prefer 6GHz band"){
                                                                                                                                     
                                         
                                                                                                                                      
                                                                                                                                      
                                                                                                                                      $WiFi_E6_True++ 
                                                                                                                                      
                                                                                                                                      write-host "Preffered Band is not running 6GHz band"
                                                                                                                                      
                                                                                                                                      }
                                         }

                                         else { 

                                         Write-Host "$Network_Name does not support Wi-Fi 6E"
                                         

                                              }
                                         }
 
if($WiFi_E6_True -gt 0) { 

                         exit 1
                         
                        }
                        
else { 

      exit 0
      
      
     }
     
     
                                                        


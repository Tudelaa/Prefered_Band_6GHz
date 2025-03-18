
# This script check if your network card support WiFi 6E checking Driver description and if so
# check if preferend band is in 6GHz.

# Writte: Antonio Tudela 



[int]$WiFi_E6_True=0

$Interfaces = Get-NetAdapter -Name Wi* | Select-Object * 




foreach ($Interface in $Interfaces) { 

                                         

                                         $Network_Name = $Interface.Name
                                         $Model = $Interface.DriverDescription
                                         $Network_Card = Get-NetAdapter -Name $Network_Name | Select-Object * -ErrorAction SilentlyContinue
                                         $Net_Properties = Get-NetAdapterAdvancedProperty -Name $Network_Name -DisplayName "Preferred Band"
                                         $Preferred_Band = $Net_properties.DisplayValue
                                                                         
                                         if ($Model -match "6E" -or $Model -match "7" ) { 
                                         #write-host "$Network_Name support Wi-Fi 6E"
                                         

                                                                                         #if ($Preferred_Band -notmatch "4. 6G first" -or $Preferred_Band -notmatch "4. Prefer 6GHz band"){


                                                                                         if ($Preferred_Band -notmatch "4.") {

                                                                                          write-host "$Network_Name model $Model support Wi-Fi 6E but prefered band is $Preferred_Band"
                                                                                                                                      
                                                                                                                                      
                                                                                                                                      $WiFi_E6_True++ 
                                                                                                                                      }

                                                                                          else { 
                                                                                          
                                                                                                write-host "$Network_Name model $Model supports Wi-Fi 6E and Prefered band is correct: $Preferred_Band" 
                                                                                               }
                                         }

                                         else { 

                                         Write-Host "$Network_Name model $Model does not support Wi-Fi 6E and band is working in $Preferred_Band"
                                         

                                              }
                                         }
 
if($WiFi_E6_True -gt 0) { 

                         exit 1
                         
                        }
                        
else { 

      exit 0
      
      
     }
     
     
               

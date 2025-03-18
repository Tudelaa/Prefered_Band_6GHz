$Network_Card = Get-NetAdapter -Name Wi* | Select-Object * -ErrorAction SilentlyContinue
$Net_Properties = Get-NetAdapterAdvancedProperty -Name Wi* -DisplayName "Preferred Band" -ErrorAction SilentlyContinue
$Model = $Network_Card.DriverDescription
$Display_Value = $Net_Properties.DisplayValue


if ($Model -match "Realtek") { 

                                                       Set-NetAdapterAdvancedProperty -Name W*i -DisplayName "Preferred Band" -DisplayValue "4. 6G first"
                                                       Write-Host "Preffered Band has changed from $Display_Value to 6GHz"
                                                       exit 0

                                                      } 

if ($Model -match "Intel" -or $Model -match "MediaTek") { 

                                                       Set-NetAdapterAdvancedProperty -Name W*i -DisplayName "Preferred Band" -DisplayValue "4. Prefer 6GHz band"
                                                       Write-Host "Preffered Band has changed from $Display_Value to 6GHz"
                                                       exit 0
     
     
                                                       } 


 else { 
 
 
      Write-Host "Preferred Band has NOT changed and continuing in $Display_Value" 
      exit 1

       }         

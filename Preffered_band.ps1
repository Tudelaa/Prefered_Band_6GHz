# this script is use as remediation to change the prefered band to 6Ghz for realtek and intel Wi-Fi network cards




$Network_values = Get-NetAdapterAdvancedProperty -Name W*i -DisplayName "Preferred Band" -ErrorAction SilentlyContinue
$Network_Card = Get-NetAdapter -Name Wi* | Select-Object * -ErrorAction SilentlyContinue
 

try {

if ($Network_Card.DriverDescription -match "Realtek") { 

                                                       Set-NetAdapterAdvancedProperty -Name W*i -DisplayName "Preferred Band" -DisplayValue "4. 6G first"
                                                       
                                                      } 

if ($Network_Card.DriverDescription -match "Intel") { 

                                                       Set-NetAdapterAdvancedProperty -Name W*i -DisplayName "Preferred Band" -DisplayValue "4. Prefer 6GHz band"
                                                       
     
     
                                                       } 

Write-Host "Preffered Band has changed to 6GHz"
  
exit 0
  
   }                                                  
      
catch {


       Write-Host "Preffered Band has not changed to 6GHz"
       
       exit 1

       }
       
         
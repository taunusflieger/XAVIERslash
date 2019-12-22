# XAVIERslash

Autonomous 1:10 RC robocar based on Traxxas Slash and controlled by NVIDIA AGX Xavier. 

I've started this project to gain some practical experience with what I've learned during the [Udacity Self Driving Car Engineer Nano Degree](https://www.udacity.com/course/self-driving-car-engineer-nanodegree--nd013)

Inspired by
* [MIT racecar](https://mit-racecar.github.io/)
* [Racecar/J](https://racecarj.com/)
* [Racecar/X](https://github.com/MarkBroerkens/RACECARX)
* [Jetson racecar](https://www.jetsonhacks.com/category/robotics/jetson-racecar/)
* [EVASIVE MANEUVERS AND DRIFTING FOR AUTONOMOUS DRIVING](https://mrsdprojects.ri.cmu.edu/2016teamd/summary/)



## USI RACECAR Components
| Component | Where to buy | Specifications | Comments |
| --------- | ------------ | -------------- | -------- |
| 1:10 Race Car chassis | [TRAXXAS Slash 4x4 Platinum](http://mobil.rc-race-shop.de/item/5452583638303452) (499,95€) | [TRAXXAS Slash 4x4 Platinum, Model 6804R](https://traxxas.com/products/models/electric/6804Rslash4x4platinum?t=support) | only chassis and brushless motor are used.|
| LiPo Battery | [HRB 3S 50C LiPo Battery 11.1 V 6000 mAh](https://www.amazon.de/dp/B072KH76JN/ref=sxbs_sxwds-stvp?keywords=lipo%2B3s1p%2B11%2C1v%2B5000&pd_rd_i=B071GNM113&pd_rd_r=a0e9bffd-c65f-4b77-b9bc-933ee07819a1&pd_rd_w=GciQa&pd_rd_wg=N7fqH&pf_rd_p=6d84c7ba-ae72-4e53-b9a4-5df18ccb370e&pf_rd_r=0KETNNM2CAC4BX2K6GDK&qid=1575366940&th=1) (47,99€) | [HRB 3S 50C LiPo Battery 11.1 V 6000 mAh](https://www.amazon.de/dp/B072KH76JN/ref=sxbs_sxwds-stvp?keywords=lipo%2B3s1p%2B11%2C1v%2B5000&pd_rd_i=B071GNM113&pd_rd_r=a0e9bffd-c65f-4b77-b9bc-933ee07819a1&pd_rd_w=GciQa&pd_rd_wg=N7fqH&pf_rd_p=6d84c7ba-ae72-4e53-b9a4-5df18ccb370e&pf_rd_r=0KETNNM2CAC4BX2K6GDK&qid=1575366940&th=1) | Two batteries one for the Xavier and one for the brushless motor |
| Stereo Camera | [ZED Camera](https://store.stereolabs.com/products/zed/?_ga=2.216136467.425714967.1575454789-386175133.1575454789) ($449,00) | [StereoLabs ZED Camera](https://www.stereolabs.com/zed/) |  |
|Lidar|  |   |  under consideration if rquired |
| Compute System | [NVIDIA AGX Xavier](https://www.nvidia.com/de-de/autonomous-machines/jetson-store/) (729,00€) | [NVIDIA AGX Xavier](https://www.nvidia.com/de-de/autonomous-machines/embedded-systems/jetson-agx-xavier/) |  |
| 500 GB SSD | [Samsung MZ-V7S500BW SSD 970 EVO Plus](https://www.amazon.de/dp/B07MFBLN7K/ref=pe_3044161_189395811_TE_SCE_dp_2) (107,60€) | [Samsung MZ-V7S500BW SSD 970 EVO Plus](https://www.samsung.com/de/memory-storage/970-evo-plus-nvme-m2-ssd/MZ-V7S500BW/) | Used for data recording |
|BLDC Motor Controller| Trampa Boards VESC 6 Plus (£225,00) | [VESC 6 MkIII - newer model](http://www.trampaboards.com/vesc-6-mkiii--the-next-generation-benjamin-vedder-electronic-speed-controller-p-27517.html)  | 80A - 120A max  |
|WiFi Card| [Waveshare AC8265 Wireless NIC Applicable for Jetson Nano 2.4G / 5G WiFi Bluetooth 4.2 Dual Mode Module](https://www.amazon.de/gp/product/B07SGDRG34/ref=ppx_yo_dt_b_asin_title_o06_s00?ie=UTF8&psc=1) (25,99€) |  [Intel Dual Band Wireless-AC 6265](https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/dual-band-wireless-ac-8265-brief.pdf) | This contains an INTEL 8265AC M.2 WIFI and Bluetooth module together with two external antennas  |
|IMU| tbd  |   |   |
|USB Hub| [ORICO - USB 3.0 Hub 12V](https://www.amazon.de/gp/product/B07B4TQTTW/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1) (24,99€)|   | Expands the USB ports on the XAVIER as more ports are required than available  |
|Game Pad| [Logitech F710 PC Gamepad](https://www.amazon.de/gp/product/B07VYSN74H/ref=ppx_yo_dt_b_asin_title_o02_s00?ie=UTF8&psc=1) (39,49€) | [Logitech F710 PC Gamepad](https://www.logitechg.com/en-us/products/gamepads/f710-wireless-gamepad.html)  | Enables manual control of the car through the game pad  |
|GC4010 bullet connectors| [GC4010](https://www.amazon.de/gp/product/B07VYSN74H/ref=ppx_yo_dt_b_asin_title_o02_s00?ie=UTF8&psc=1)  |   | Required to connect the TRAXXAS Venineon BLDC to the VESC   |
|JST-PH JST Connector Kit| [JST-PH 2mm Pitch](https://www.amazon.de/gp/product/B01II33IYU/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1)  |   | Required to connect the TRAXXAS Servo to the VESC servo terminal  |


## Software Installation
It turns out that the latest Tegra NVIDIA L4T 32.2.3 with 4.9.140 Kernel configuration is missing support for the Logitech F710 Gamepad. The gamepad is required for the teleoperations of the car. To fix this we need to:
1. Install the cross compile tool chain to be able to build the kernel on a x86 system (host). Another option would be to build the kernel directly on the Xavier, but than we need to transfer it back to the host system to be able to sign it with the SDK manager. Only signed kernel files can be executed on the Xavier. The NVidia recommended approach is to cross compile.
2. Download the kernel sources. See details [here](https://docs.nvidia.com/jetson/archives/l4t-archived/l4t-322/index.html#page/Tegra%2520Linux%2520Driver%2520Package%2520Development%2520Guide%2Fkernel_custom.html%23wwpID0E0FD0HA)
3. Save the current kernel configuration file. Use it as the basis for modification to include F710 support. Copy the config file to the host system
4. Compile the kernel
5. Sign the kernel binary
6. Flash the Xavier with the new kernel binary

## Connecting the VESC to the TRAXXAS Venineon BLDC
The VESC has three connectors for the BLDC named A, B, C. The BLDC has initialy colored the three cables in white, yellow and blue. As the connector types of the BLC and the VESC don't match, we change the connectors of the BLDC to 4 mm male connectors (GC4010 bullet connectors). In this process we also use new colors for the connector cables to make make it easier in the future connecting the VESC to the BLDC.

A output -> White motor connector -> Black

B output -> Yellow motor connector -> Yellow

C output -> Blue motor connector -> Red

## Connecting the VESC to the TRAXXAS Servo
The VESC has a JST-PH terminal for connecting the servo. Again this connector is not compatible to the TRAXXAS connector of the servo. The association of the TRAXXAS servo cable colors to the VESC servo terminal is the following:

TRAXXAS Servo Red -> VESC 5V

TRAXXAS Servo Black -> VESC GND

TRAXXAS Servo White -> VESC Servo




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
|WiFi Card| tbd |   |   |
|WiFi antenna| tbd |   |   |
|IMU| tbd  |   |   |
|USB Hub| tbd |   | Expands the USB ports on the XAVIER as more ports are required than available  |
|Game Pad| tbd |   | Enables manual control of the car through the game pad  |





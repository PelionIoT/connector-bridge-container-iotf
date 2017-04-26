mbed Device Connector integration bridge image importer for IBM IoTF

Original Date: January 22, 2016

4/26/2017: Updated with the latest bridge (patches for R1.2 GA)

1/26/2017: Updated with the latest bridge. 

1/17/2017: Updated with the latest bridge. Happy New Year!

Bridge source (Apache 2.0 licensed - Enjoy!): https://github.com/ARMmbed/connector-bridge.git

Install directly into Bluemix as a Container:
[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy?repository=https://github.com/ARMmbed/connector-bridge-container-iotf.git)

Local installation Prerequisites (Ubuntu 14.04 LTS only):
- IBM Bluemix Account created and setup
- Understanding if your default Bluemix namespace ("dev" used in sample below)
- Understanding of your default Bluemix container namespace ("dev" used in sample below)
- ICE 3.0 Bluemix utilities installed
- IBM Cloud Foundary utilities installed
- Docker installed

Local importation: Scripts to import container runtime containing the connector-bridge into Bluemix:

    ubuntu% ./build_connector_bridge.sh

    Usage: ./build_connector_bridge.sh <bm user> <bm password> <space> <container namespace> <container instance name>

    ubuntu% ./build_connector_bridge.sh myBMUsername myBMPassword dev dev connector-bridge


Copyright 2015. ARM Ltd. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 

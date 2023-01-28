********
Releases
********

API v0.0.1 (Latest)
===================

This is the initial version of KR Android API. It supports the following features:

* **Core Components**

  * KRFragment - Entry-point of every CBun App.

* **Data Types**

  * Number - Integer or floating point number.

  * RobotPose - Represents position, orientation, configuration and reference frame.

  * Load - Mass, center of gravity, inertia matrix and pose.

* **Editor**

  * Variable - Holds value of the specified data type.

  * VarRegister - Provides access to Program and Workcell variables.

  * Teaching Manager - Allows to override teaching intent handling.

  * Selection Manager - Controls and monitors the selection of variables. 

* **Robot**

  * Robot Model - Provides system values, such as joints, frames and loads.

  * XML-RPC Client - Allows to communicate with backend.

* **View**

  * Drag Manager - Allows to handle drag&drop events.

  * VarDropBox - Serves as a drop target for variables.

* **Utils**

  * KRLog - Logs data to the logger. 

  * KRSystem - Allows to exit the CBun app.

In order to keep full compatibility with the Teach Pendant host app, the CBun App based on this API version has to match the following versions:

.. list-table:: 
   :widths: 25 25
   :header-rows: 1
   :align: center

   * - Dependency
     - Version
   * - Robot SW Package
     - FF
   * - Gradle
     - 7.4
   * - Android Gradle Plugin
     - 7.3.1
   * - Compile SDK
     - 33
   * - Target SDK 31
     - 31
   * - Min SDK
     - 28
   * - Java 
     - 1.8
   * - Kotlin Gradle Plugin
     - 1.7.10
   * - Kotlin Compiler
     - 1.5.21
   * - Kotlin Compiler Extension
     - 1.3.1
   * - Jetpack Compose
     - 1.3.1
   * - App Compat Library
     - 1.5.1

Download KR Android API library v0.0.1 at :download:`api-external-v0-0-1.aar <../releases/api-external-v0-0-1.aar>`




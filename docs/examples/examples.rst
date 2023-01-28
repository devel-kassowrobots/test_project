*************
Code Examples
*************

This holds examples for using kr2_android_api.

Data Types
==========

Number
------

.. code-block:: java

    // Constructs new instance of default (zero) number.
    Number num1 = new Number(); 

    // Constructs new instance of long integer number.
    Number num2 = new Number(10);

    // Constructs new instance of floating point number.
    Number num3 = new Number(3.14);

    // Returns long integer value from the number.
    long a = num2.l();

    // Returns double integer value from the number.
    double b = num3.d();

    // Assigns long integer value to the number.
    num2.set(5);

    // Assigns floating point value to the number.
    num3.set(1.4);

RobotPose
---------

.. code-block:: java

    // Constructs new instance of default (zero) robot pose.
    RobotPose rpose1 = new RobotPose(); 

    // Constructs new instance of robot pose with given position and orientation.
    RobotPose rpose2 = new RobotPose(
                               new Position(0.1, 0.2, 0.3),      // [m]
                               Rotation.fromRPY(0.4, 0.5, 0.6)   // [rad]
                           );

    // Constructs new instance of robot pose with given position, orientation, configuration and reference.
    RobotPose rpose3 = new RobotPose(
                               new Position(0.1, 0.2, 0.3),      // [m]
                               Rotation.fromRPY(0.4, 0.5, 0.6),  // [rad]
                               new JSVector(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7), // [rad]
                               reference  // instance of IVar<RobotPose>
                           );

    // Constructs new instance of robot pose as a copy of source instance.
    RobotPose rpose3 = new RobotPose(rpose3);

    // Returns the robot pose position.
    Position pos = rpose1.position(); 
    double posX = pos.getX();  // [m]
    double posY = pos.getY();  // [m]
    double posZ = pos.getZ();  // [m]

    // Returns the robot pose orientation.
    Rotation rot = rpose1.rotation();
    double rotR = rot.asRPY().getR();  // [rad]
    double rotP = rot.asRPY().getP();  // [rad]
    double rotY = rot.asRPY().getY();  // [rad]

    // Returns the robot pose joint configuration.
    JSVector config = rpose1.configuration();
    double j1 = config.getJ1();  // [rad]
    double j2 = config.getJ2();  // [rad]
    double j3 = config.getJ3();  // [rad]
    double j4 = config.getJ4();  // [rad]
    double j5 = config.getJ5();  // [rad]
    double j6 = config.getJ6();  // [rad]
    double j7 = config.getJ7();  // [rad]

    // Returns the robot pose reference.
    IVar<RobotPose> ref = rpose3.getReference();

    // Assings the reference to the robot pose.
    rpose2.setReference(ref);

    // Clears the robot pose reference.
    rpose3.setReference(null);


Load
----

.. code-block:: java

    // Constructs new instance of default (zero) load.
    Load load1 = new Load(); 

    // Constructs new instance of load with given mass, center of gravity, inertia matrix and pose.
    Load load2 = new Load(
                         0.5,  // [kg]
                         new Position(0.1, 0.2, 0.3), // center of gravity [m]
                         new InertiaMatrix(1, 1, 1, 0, 0, 0), // [kg.m2]
                         pose // instance of IVar<RobotPose>

                     );

    // Constructs new instance of load as a copy of source instance.
    Load load3 = new Load(load2);

    // Returns the mass of the load.
    double mass = load1.getMass();

    // Returns the center of gravity.
    Position cog = load1.centerOfGravity();
    double x = cog.getX();  // [m]
    double y = cog.getY();  // [m]
    double z = cog.getZ();  // [m]

    // Returns the inertia matrix.
    InertiaMatrix imx = load1.inertiaMatrix();
    double xx = img.getXX();  // [kg.m2]
    double yy = img.getYY();  // [kg.m2]
    double zz = img.getZZ();  // [kg.m2]
    double xy = img.getXY();  // [kg.m2]
    double xz = img.getXZ();  // [kg.m2]
    double yz = img.getYZ();  // [kg.m2]

    // Returns the pose of the load.
    IVar<RobotPose> pose = load1.getPose();

    // Assigns new mass to the load.
    load2.setMass(0.6);  // [kg]
 
    // Assigns the pose to the load.
    load2.setPose(pose);

    // Clears the pose of the load.
    load2.setPose(null);


Variables
=========

Program & Workcell Register
---------------------------

.. code-block:: java

    // Retrieves register of all program and workcell variables.
    VarRegister register = VarRegister.getOpenedRegister();

    // Returns all registered variables in form of list. 
    List<IVar<?>> varList = register.getVarList();

    // Returns all registered variables of Number data type in form of list.
    List<IVar<Number>> numVarList = register.getVarList(Number.class);

    // Returns all registered variables of RobotPose data type in form of list.
    List<IVar<RobotPose>> rposeVarList = register.getVarList(RobotPose.class);

    // Returns all registered variables of Load data type in form of list.
    List<IVar<Load>> loadVarList = register.getVarList(Load.class);

Anonymous
---------

.. code-block:: java

    // Constructs new anonymous custom variable with number data type.
    IVar<Number> var1 = Var.Custom(
                            "var1",           // label of the variable
                            new Number(3.14)  // initial value
                        );

    // Constructs new anonymous custom variable with robot pose data type.
    IVar<RobotPose> var2 = Var.Custom(
                               "var2",         // label of the variable
                               new RobotPose(  // initial value
                                   new Position(0.1, 0.2, 0.3),     // [m]
                                   Rotation.fromRPY(0.4, 0.5, 0.6)  // [rad]
                               )
                           );

    // Constructs new anonymous custom variable with load data type.
    IVar<Load> var3 = Var.Custom(
                          "var3",         // label of the variable
                          new Load(       // initial value
                              0.5,                               // [kg]
                              new Position(0.1, 0.2, 0.3),       // [m]
                              new InertiaMatrix(0.4, 0.5, 0.6),  // [kg.m2]
                              null
                          )
                      );

    // Constructs new anonymous system variable that maps TCP frame.
    IVar<RobotPose> var4 = Var.System("var4", FrameID.TCP);

    // Constructs new anonymous system variable that maps Payload.
    IVar<Load> var5 = Var.System("var5", LoadID.PAYLOAD);

Value Modification
------------------

.. code-block:: java

    // Constructs anonymous robot pose variable with default initial value.
    IVar<RobotPose> rposeVar = Var.Custom(
                                   "rposeVar",  // label of the variable
                                    new RobotPose(  // initial value
                                        new Position(0.1, 0.2, 0.3),     // [m]
                                        Rotation.fromRPY(0.4, 0.5, 0.6)  // [rad]
                                    )
                               );

    // Obtains value (snapshot) from the variable.
    RobotPose rpose = rposeVar.getValue();

    // Modifies the robot pose value.
    rpose.position().setX(0.15);
    rpose.position().setY(0.25);
    rpose.position().setZ(0.35);

    // Assigns the modified value back to the variable (and triggers UI refresh).
    rposeVar.setValue(rpose);

VarDropBox
----------

.. code-block:: java

    /*
     * Constructs VarDropBox from context. Make sure to use KRContext.
     */
    VarDropBox varDropBox = new VarDropBox(getKRContext());

    /*
     * Sets hint text, ie. the text to be show when the box is empty.
     */
    varDropBox.setHintText("Tap or drop variable");

    /*
     * Sets on click listener. This listener is invoked if user clicks the box.
     */
    varDropBox.setOnClickListener(view -> {
        // TODO: handle box click action 
    });

    /*
     * Sets on clear listener. This listener is invoked if user removes a variable
     * from the drop box by clicking the clear button.
     */
    varDropBox.setOnClearListener(variable -> {
        // TODO: handle clear button click action
    });

    /*
     * Sets on var click listener. This listener is invoked if the user clicks
     * the variable within the drop box.
     */
    varDropBox.setOnVarClickListener(variable -> {
        // TODO: handle var click action
    });
  
    /*
     * Sets the drop listener. This listener is invoked if the user drops a variable
     * into the drop box.
     */
    varDropBox.setOnDropListener(variable -> {
        // TODO: handle var added action
    });


Editor
======

Selection Manager
-----------------

.. code-block:: java
   
    /*
     * Selection manager can be obtained as a KRService from KRContext. The following line 
     * demonstrates how you can get the selection manager inside the KRFragment class. Note 
     * that the service will be available only on the real robot and not in the emulated 
     * environment. 
     */
    SelectionManager manager = getKRContext().getKRService(KRContext.SELECTION_MANAGER_SERVICE);

    /*
     * Retrieves list of selected variables. If the list is empty, no variables are selected.
     */
    List<IVar<?>> varList = manager.getVarSelection();

    /*
     * Selects single variable. Such variable will be highlighted in the UI and its parameters
     * will be accessible via Options Panel.
     */
    manager.setSelection(var);

    /*
     * Selects multiple variables. Such variables will be highlighted in the UI. 
     */ 
    List<IVar<?>> varList2 = new ArrayList();
    varList2.add(var1);
    varList2.add(var2);
    manager.setVarSelection(varList2);

    /*
     * Clears variable selection, ie. deselects all variables.
     */
    manager.setVarSelection(new ArrayList());

Teaching Manager
----------------

.. code-block:: java

    /*
     * Teaching manager can be obtained as a KRService from KRContext. The following line
     * demonstrates how you can get the teaching manager inside the KRFragment class. Note 
     * that the service will be available only on the real robot and not in the emulated 
     * environment. 
     */
    TeachingManager manager = getKRContext().getKRService(KRContext.TEACHING_MANAGER_SERVICE);

    /*
     * Your own custom teaching handler implementation.
     */
    CustomTeachingHandler handler = () -> {
        // TODO: Implement action to be executed on teaching intent (such as adding new pose).
    };

    /*
     * Attaches the handler to the teaching manager. Once the handler is attached, its
     * onTeachingIntent method will be executed on each teaching intent (ie. on each 
     * back drive button double click). It is recommended to attach the handler once 
     * the CBun UI is created (for example in onCreateView method of KRFragment). 
     */
    manager.attach(handler);

    /*
     * Detaches the handler from the teaching manager once it is not needed anymore. 
     * Do not forget to detach the handler when CBun App is closed, otherwise the default
     * teaching handler will not be triggered. It is recommended to detach the handler once
     * the CBun UI is destroyed (for example in onDestroyView method of KRFragment). 
     */
    manager.detach(handler);

Drag&Drop Manager
-----------------

.. code-block:: java

    /*
     * Drag manager can be obtained as a KRService from KRContext. The following line 
     * demonstrates how you can get the drag manager inside the KRFragment class. Note 
     * that the service will be available only on the real robot and not in the emulated 
     * environment. 
     */
    DragManager manager = getKRContext().getKRService(KRContext.DRAG_MANAGER_SERVICE);    

    /*
     * Adds your view to the drag manager. Such view can respond to drag events.
     */
    manager.addDropView(myView, aEvent -> {
        // TODO: Implement action to be executed on drag events provided to your view.        
    });

    /*
     * Removes your view from the drag manager. Such will no more trigger respond to 
     * drag events. 
     */
    manager.removeDropView(myView);

Robot
=====

Model
-----

.. code-block:: java

    /*
     * Returns the model of the real robot. 
     */
    Model model = Model.getRealModel();

    /* 
     * Returns flange frame expressed in world frame. 
     */
    Frame flangeFrame = model.getFrame(FrameID.FLANGE, FrameID.WORLD);
    double flangePosX = flangeFrame.position().

    /*
     * Returns current TCP frame expressed in flange frame. 
     */
    Frame tcpFrame = model.getFrame(FrameID.TCP, FrameID.FLANGE);

    /*
     * Returns current tool load.
     */
    Load toolLoad = model.getLoad(LoadID.TOOL);

    /*
     * Returns current payload.
     */
    Load payload = model.getLoad(LoadID.PAYLOAD);

    /*
     * Returns current joints angle.
     */
    JSVector jointsAngle = model.getJoints(SystemID.JOINTS_ANGLE);


XML-RPC 
-------

.. code-block:: java

    /*
     * Constructs XML-RPC client for given server ID.
     */
    XmlRpcClient client = new XmlRpcClient("test");

    /*
     * Prepares XML-RPC call params.
     */
    Params params = new Params();
    params.add(new ValueInt(10));  // int argument

    /*
     * Executes XML-RPC call and handles possible failure.
     */
    try {
        Value ret = client.execute(
                               "getData",  // method name
                               params,     // method params
                               2           // timeout [s]
                           );
        // TODO: process output value
    } catch (Fault e) {
        // TODO: handle XML-RPC failure
    }

Utilities
=========

KRLog
-----

.. code-block:: java

    /*
     * Adds debug log.
     */
    KRLog.d("MyClass", "This is debug message");

    /*
     * Adds error log.
     */
    KRLog.e("MyClass", "This is error message", e);


KRSystem
--------

.. code-block:: java

    /*
     * Closes CBun App, ie. removes KRFragment from screen and destroys it.
     */
    KRSystem.exit();


Transform
---------

.. code-block:: java

    /*
     * Converts robot pose into a new reference, ie. the reference pose is updated
     * and the coordinates are recalculated.
     */
    RobotPose out1 = Transform.convertToNewReference();

    /*
     * Moves the robot pose into a new reference, ie. the coordinates are untouched
     * and the reference pose variable is updated.
     */ 
    RobotPose out2 = Transform.moveToNewReference(out1, refVar2);

    /*
     * Evaluates robot pose into world frame.
     */
    Frame frame = Transform.evaluate(out2);

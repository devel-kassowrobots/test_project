***
FAQ
***

* **Why something is not working?**

Kassow Android API is still under development and subject to change.

* **Why ConstraintLayout/RelativeLayout is not working?**

Kassow Android API core does not support XML definition of some layouts (such as RelativeLayout or ConstraintLayout). Use these containers programmatically or redesign the UI with LinearLayout. 

* **Why some widgets look different in emulator and on real robot?**

When the CBun App runs on a real robot, it generates the UI from XML layout with default theme. Define the style explicitly for each widget in XML layout in order to achieve consistent behaviour.

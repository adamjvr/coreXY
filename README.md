CoreXY 3D Printer
==================

A 3D printer using the CoreXY configuration which is based on jand1122's https://github.com/jand1122/RepRap-XY and zelogik's https://github.com/zelogik/AluXY CoreXY 3D printer. 

All source code is written using OpenSCAD.


Modifications include:
* XY ends for a vertical x-axis
* X-carriage (for vertical x-axis) with belt clamps. Uses 30mm spaced screws for mounting extruder/hotend. 
* 10x2 Trapezoidal leadscrew with flange nut
* M5 frame mounting screws

Updates in latest version:
* Less plastic for motor ends, xy-block and idler ends - 18% less plastic
* Separate motor mounts (remove tensioner bearings). Belts are tensioned by sliding motor mount along t-slot.


Frame Size: 400x400x500


Bill of Materials
==================

*Note: This list is only a rough guide and there may be some inconsistencies due to various changes over time.*


**Frame - 20x20 aluminium extrusions (t-slot or v-slot)**
* 4x 500mm length
* 12x 360mm length
* Lots and lots of t-nuts 
* Fittings for corners (i.e. hidden 90deg bracket, brackets, printed brackets)
* Some drop-in t-nuts (for adding parts after frame is assembled)
* ??x M5 button cap bolt

**Z-axis**
* 2x 12mm smooth rod
* 1x Trapezoidal leadscrew (10mm diameter with 2mm pitch)
* 1x 5x10mm rigid coupler 
* 1x 10X2 flanged trapezoidal bronze nut
* 1x 6300Z bearing 
* 2x LM12LUU linear bearing (12mm "long" bearing) - can also use 4x LM12UU 
* 4x Double t-nut (or use 8 t-nuts)
* 14x 40mm M5 bolt
* 8x 25mm M5 bolt
* 4x 15mm M3 bolt (to attach nema motor)
* 1x NEMA17 Stepper motor

**X & Y axis**
* 2x NEMA17 stepper motors
* 24x F624ZZ flanged bearings
* 2x 330-350mm 8mm diameter smooth rod (y-axis)
* 2x 400mm 8mm diameter smooth rod (x-axis)
* 6x LM8UU 8mm linear bearing 
* Approx. 3-4m GT2 belt 
* 2x 20 tooth GT2 Pulley
* 4x 60mm M4 bolts (for XY block bearings)
* ??x M4 bolts 
* Lots of M4 nuts and washers
* ??x M3 bolts
* 12x 40mm M3 bolts
* 8x 40mm M4 bolts (for idler bearings, screws can be longer)
* ??x M3 nuts and washers
* ??x M5 washers
* ??x M5 nuts
* 8x 25mm M5 bolts
* 6x 55mm M5 bolts
* 4x 30mm M5 bolts
* 6x 15mm M3 bolt 
* 8x 10mm M3 bolt (attach nema motors)



Assembly Notes
==============

* There must be a washer on the outsides of the flange bearings to run smoothly (i.e washer->bearing->bearing->washer). 

* Belt layout diagram:

![ScreenShot](/BeltLayoutDiagram.png)



**Notice: This is a work in progress. Use at your own risk!**


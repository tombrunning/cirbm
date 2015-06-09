# cirbm
rbm with compressed inputs
driver: testing ddr2 memory

Steps to this repeat this demo:
    1. Open stratix iv CD files, locate .\DE4_Install\demonstrations\Q11.1_sp1_QSYS\DE4_530\DE4_DDR2_UniPHY
    2. Compile Qsys. 
    3. Run Tcl files. 
    4. Comple the entire quartus project, down load to FPGA.
    5. Open Eclipse. Import projects based on <above_directory>\software\DE4_DDR2_test and ~\DE4_DDR2_test_bsp
      * import type is Nios II software build tools project
    6. Run the sw project on the sopc file generated from the demo quartus project.

Steps with other settings: 
    1. Open stratix iv CD files, locate ./Tools/DE4_SystemBuilder/DE4_SystemBuilder.exe
    2. Select components you need and generate a demo project.
    3. Extend from there by adding in your customised design with correct interfaces.

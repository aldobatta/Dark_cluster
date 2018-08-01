# Dark_cluster
Info on how to us the cluster @ DARK


## Setting the modules needed for compilation


When login into the cluster you need to import a few modules (containing the compilers you'll need).

You'll need the following commands to load/unload and check which modules are up or down.

Command        |    Action

#------------------------------------------------------------------------------------------------------#

module list    |  gives a list of the modules already available for use.

#------------------------------------------------------------------------------------------------------#

module avail   |  gives a list of the available modules.

#------------------------------------------------------------------------------------------------------#

module load modulename   | load the module named "modulename" so that it is ready for use

#------------------------------------------------------------------------------------------------------#

module unload modulename | unload the module named "modulename" so that it is no longer ready for use



The modules you'll need to compile codes like Flash or Gadget are:

1) /intel/15.0.1         |   Module with intel compilers (C,fortran, and others) 

2) /intelmpi/5.0.2.044   |   Module with intel mpi library compilers (for code parallelized with mpi) 



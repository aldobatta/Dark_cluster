# Dark_cluster
Info on how to us the cluster @ DARK


## Setting the modules needed for compilation


When login into the cluster you need to import a few modules (containing the compilers you'll need).

You'll need the following commands to load/unload and check which modules are up or down.

**Command**        |       *Action*

#------------------------------------------------------------------------------------------------------#

**module list**    |     *gives a list of the modules already available for use.*

#------------------------------------------------------------------------------------------------------#

**module avail**   |     *gives a list of the available modules.*

#------------------------------------------------------------------------------------------------------#

**module load modulename**   |    *load the module named "modulename" so that it is ready for use*

#------------------------------------------------------------------------------------------------------#

**module unload modulename** |    *unload the module named "modulename" so that it is no longer ready for use*



### The modules you'll need to compile codes like Flash or Gadget are:

1) **/intel/15.0.1**         |    Module with intel compilers (C,fortran, and others) 

2) **/intelmpi/5.0.2.044**  |    Module with intel mpi library compilers (for code parallelized with mpi) 


## Flash

1) The first step is to ask for permission to download Flash from the link:

http://flash.uchicago.edu/site/flashcode/coderequest/

2) Once you get an email with details for your account download one of the different versions of the code.


3) You'll get a file named **FLASH4.5.tar.gz** (or with a diferent version). Copy the file to folder where you want to extract it. If you want to upload it to the cluster use **scp** or **ftp**. Once in the cluster you can extract it with:

**tar -xzvf FLASH4.5.tar.gz**

4) This will create a folder named FLASH4.5 with all the relevants files inside (mostly fortran code).

5) Take a look at the manual:

http://flash.uchicago.edu/site/flashcode/user_support/flash4_ug_4p5.pdf


### Run a Sedov test

Up to this point Flash is still not ready for use. The easy way to try it is to run on of the default tests. You can get an idea of the kind of tests at Flash4.5/source/Simulations/SimulationsMain. **This is the folder where new "setups" (initial conditions and physics to be used) are defined.**






1) go into the Flash4.5/ folder and run:

**./setup Sedov -auto**

7) This will create an object folder (called object) which contains all relevant files to run a Sedov test.












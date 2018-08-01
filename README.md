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

The easy way to get used to Flash is to run some of the default tests. Thy are contained in the folder *Flash4.5/source/Simulations/SimulationsMain/*. **This is the folder where new "setups" (initial conditions and physics to be used) are defined.**


1) go into *Flash4.5/* and run:

**./setup Sedov -auto**

2) This will create an object folder, which is called "object" by default. The name can be changed by adding **-objdir=foldername** to the command above. This object folder will contain all relevant files to run a Sedov test.

The cluster @ Dark is not in the list of default clusters contained in *Flash4.5/sites/* so the command **./setup Sedov -auto** will create a generic Makefile and Makefile.h inside the folder *object* according to the OS of the cluster.

3) Go to */Flash4.5/object/* and take a look at **Makefile.h**. It contains definitions of location and names of libraries  and compilers needed to compile Flash. This file must be edited to in order to compile it.












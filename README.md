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

### Compiling the "setup" to obtain an executable file to run the simulation

1) go into *Flash4.5/* and run:

**./setup Sedov -auto**

2) This will create an object folder, which is called "object" by default. The name can be changed by adding **-objdir=foldername** to the command above. This object folder will contain all relevant files to run a Sedov test.

The cluster @ Dark is not in the list of default clusters contained in *Flash4.5/sites/* so the command **./setup Sedov -auto** will create a generic Makefile and Makefile.h inside the folder *object* according to the OS of the cluster.

3) Go to */Flash4.5/object/* and take a look at **Makefile.h**. It contains definitions of location and names of libraries  and compilers needed to compile Flash. This file must be edited to in order to compile Flash.

4) Download the **Makefile.h** from:

https://github.com/aldobatta/Dark_cluster/blob/master/Makefile.h

And place it in the object folder that was created after running **./setup Sedov -auto**. This file has been already modified to point to the right directories for mpi and hdf5 libraries and compilers.

**Note:** any modifications to *Makefile.h* in the */object* folder, will be present when creating new object folders for new setups **./setup Simulation**.

5) Once you moved *Makefile.h* to the object folder compile Flash with the command:

**make**

or

**make -j 6**  which will use 6 CPUs to compile instead of one and will be much faster.

6) If everything is defined correctly in *Makefile.h* and the needed modules are loaded correctly, this should produce an executable file named **flash4**. This is the file used to run the simulation you just defined. 

### Creating a folder for the simulation outputs.

I recommend to have your outputs written outside of the *Flash4.5* folder, so that you can safely remove/modify/delete things inside *Flash4.5/* without worrying about deleting important results or viceversa.

1) Create a directory outside *Flash4.5/* to save your outputs.

**mkdir simulationName**

2) Copy the file **flash.par** inside the object folder to the folder you just created.

This file contains properties for the simulation, like resolution, final time, boundary conditions, etc. For some simulations, you may need to copy additional files to this folder (not for the Sedov test).

### Running jobs in the cluster

Once we have the file **flash4** we cannot just execute the file to run our simulation. In computing clusters there's usually a workload manager (a program) in charge of organizing all jobs, simulations, scripts, etc. sent by the cluster's users.

**Slurm** is the workload manager used by the **Dark cluster**. Check these links with useful commands and a brief explanation of how it works.

https://slurm.schedmd.com/quickstart.html

https://slurm.schedmd.com/pdfs/summary.pdf

When sending a job to the cluster (running a simulation) one has to create a script instructing **Slurm** how many CPUs (or tasks) want to be used, the ammount of RAM memory required by each CPU, the file that needs to be executed (**flash4** in our case) and other details.

An example of a script with said instructions can be found here:

https://github.com/aldobatta/Dark_cluster/blob/master/JobScript.sh

In these scripts, all instructions directed to **Slurm** start with a **#**, like:

**#SBATCH --nodes=2                # number of nodes allocated for this job**

**#SBATCH --ntasks-per-node=32     # number of MPI ranks per node, There are 32 CPUs per node**

Which allocates the number of nodes and CPUs wanted for the job.

Each node in the Dark cluster has 32 CPUs (tasks), so the instructions above are asking for 64 CPUs. You can ask for less than 32 CPUs in different nodes, but it's better to use all CPUs available in a node since they are usually not assigned to another job and remain unused, wasting CPU time.

### Sending your job to the queue

1) First make sure to put **JobScript.sh** (feel free to rename it) into the folder you want the outputs to be saved (**simulationName**).

Once you modified the script to run your executable file **flash4** in *N* CPUs, you need to send it to **Slurm** which will put your job in the queue, and if there are enough nodes/CPUs available (not being used) your simulation will start running.

2) Send your job to the queue run:

**sbatch JobScript.sh**

The error and output files will be created in the same location as **JobScript.sh**. And an email should be sent to the email address indicating important events, like if the job stopped or started.

3) As soon as there are enough CPUs available to run your job, you'll job will start running. 

### Checking jobs in queue

You can check how many jobs are in the dark queue with:

**squeue -p dark**

Here you can see the jobs youe sent to the queue, and all other jobs in the queue.

You can check the status of your jobs using your **username**:

**squeue -u username**

### Stoping jobs in queue

You can cancel a job with:

**scancel jobID**

or

**scancel --name=jobName**


The **jobID** can be seen with **squeue**, and it is assigned to your job once it starts running  (It should appear in the email notification).

For a list of **Slurm** useful commands check:

https://slurm.schedmd.com/pdfs/summary.pdf






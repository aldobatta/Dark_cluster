#!/bin/bash                                                                                                        
#                                                                                                                  
# SLURM resource specifications                                                                                    
# (use an extra '#' in front of SBATCH to comment-out any unused options)                                          
#                                                                                                                  
#SBATCH --job-name=jobname       # shows up in the output of 'squeue'                                                     
#SBATCH --time=4-23:59:59        # specify the requested wall-time (days-hrs:minutes:secs)                                              
#SBATCH --partition=dark         # specify the partition to run on                                                        
#SBATCH --nodes=2                # number of nodes allocated for this job                                          
#SBATCH --ntasks-per-node=32     # number of MPI ranks per node, There are 32 CPUs per node                 
#SBATCH --cpus-per-task=1        # number of OpenMP threads per MPI rank                                           
#SBATCH -o out_filename          # create outfile showing all screen prints from the job                                                                    
#SBATCH -e error_filename        # create errorfile showing errors from slurm and the cluster                                                                  


#SBATCH --mail-user=youremail@yourinstitution.edu # please put your own email, I don't want your error messages                

# Load default settings for environment variables                                                                  
source /users/software/dark/startup.d/modules.sh

# If required, replace specific modules                                                                            
# module unload intelmpi                                                                                           
# module load mvapich2                                                                                             

# When compiling remember to use the same environment and modules                                                  

### set executable (and its location in the cluster)                                                                                                 
EXE="/groups/dark/username/FLASH4.5/object/flash4"

# Execute the code                                                                                                 
srun $EXE

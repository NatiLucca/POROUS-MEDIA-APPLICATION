rm *.mod # deleta arquivos módulos
rm *.out # deleta executável
sh cleaning.sh  # apaga arquivos que não serão utilizados

export OMP_NUM_THREADS=32
export NO_STOP_MESSAGE=yes
export OMPTARGET_LIBS=$LIBOMP_LIB
export LIBRARY_PATH=$OMPTARGET_LIBS

/opt/nvidia/hpc_sdk/Linux_x86_64/21.2/compilers/bin/pgf90 -O3 -Mpreprocess -fast -ta=tesla -mp \
         comum.f90 \
properties_CH4.f90 \
       initial.f90 \
nonsymetric_mesh.f90 \
     comp_mean.f90 \
      boundary.f90 \
         main.f90  \
     equations.f90 \
   convergence.f90 \
     transient.f90 \
        output.f90 \
         probe.f90 \
      flametip.f90 \
-o cylinder_solver.out

sudo nvprof --print-gpu-trace ./cylinder_solver.out
 

#gmon.out > Resultados/reportGprof.txt

# sh pos.sh


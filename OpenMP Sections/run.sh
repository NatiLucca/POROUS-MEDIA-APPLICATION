rm *.mod # deleta arquivos módulos
rm *.out # deleta executável
sh cleaning.sh  # apaga arquivos que não serão utilizados

if [ ! -d "Resultados" ]; then
	mkdir Resultados
else
	rm Resultados/*.txt
fi

#export OMP_NUM_THREADS=16
export NO_STOP_MESSAGE=yes

#gfortran -O3 -fopenmp \
#gfortran -O3 -fopenmp -pg \
/opt/nvidia/hpc_sdk/Linux_x86_64/21.2/compilers/bin/pgf90 -O3 -fopenmp\
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


(time ./cylinder_solver.out) 2> Resultados/exec_0_omp_sections_124.txt 
(time ./cylinder_solver.out) 2> Resultados/exec_1_omp_sections_124.txt 
(time ./cylinder_solver.out) 2> Resultados/exec_2_omp_sections_124.txt 
(time ./cylinder_solver.out) 2> Resultados/exec_3_omp_sections_124.txt 
(time ./cylinder_solver.out) 2> Resultados/exec_4_omp_sections_124.txt 
(time ./cylinder_solver.out) 2> Resultados/exec_5_omp_sections_124.txt 
(time ./cylinder_solver.out) 2> Resultados/exec_6_omp_sections_124.txt
(time ./cylinder_solver.out) 2> Resultados/exec_7_omp_sections_124.txt
(time ./cylinder_solver.out) 2> Resultados/exec_8_omp_sections_124.txt
(time ./cylinder_solver.out) 2> Resultados/exec_9_omp_sections_124.txt 
(time ./cylinder_solver.out) 2> Resultados/exec_10_omp_sections_124.txt
(time ./cylinder_solver.out) 2> Resultados/exec_11_omp_sections_124.txt     

# sh pos.sh


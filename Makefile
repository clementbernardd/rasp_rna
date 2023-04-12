export RASP=/src/lib/rasp/

all:  rna

pdb:
	cd src/pdb-library; make CFLAG=${CFLAG}
tool:
	cd src/tool-library; make CFLAG=${CFLAG}
rna: pdb tool
	cd src/rna; make CFLAG=${CFLAG}; cd ../..; mkdir -v bin; cp src/rna/rasp*_fd bin

clean:
	\rm -rf bin;cd src/pdb-library; \rm *.o; cd ../tool-library; \rm *.o; cd ../rna; \rm *.o rasp_fd rasp_profile_fd

docker_start: 
	docker build -t rasp .
	docker run -it rasp

run: rna
	./bin/rasp_fd -e all -p example/1Z43.pdb


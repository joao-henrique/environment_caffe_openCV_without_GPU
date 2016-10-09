#!/usr/bin/env bash
print "Instalando o OpenCV"

	apt-get update
	apt-get install -y python python-sklearn python-skimage python-scikits-learn cmake python-tk
	apt-get install -y bc libatlas-base-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev
	apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler  expect-dev unzip
	apt-get install -y cmake gflags glog libgoogle-glog libhdf5 libgflags-dev libgoogle-glog-dev liblmdb-dev


	git clone https://github.com/Itseez/opencv.git /home/vagrant/opencv

	cd /home/vagrant/opencv

	mkdir build
  cd build
	cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
	make -j7 # runs 7 jobs in parallel
	sudo make install




	rm -rf /usr/local/caffe
	git clone https://github.com/BVLC/caffe /home/vagrant/caffe

	sudo ln -s /usr/lib/x86_64-linux-gnu/libhdf5_serial.so.8.0.2 /usr/lib/x86_64-linux-gnu/libhdf5.so
	sudo ln -s /usr/lib/x86_64-linux-gnu/libhdf5_serial_hl.so.8.0.2 /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
	#chown -R vagrant:vagrant ~/.ipython
	chown -R vagrant:vagrant /home/vagrant/caffe/.*

	cd /home/vagrant/caffe

	# make sure we do not use the gpu
	#sed -e 's/# CPU_ONLY/CPU_ONLY/' Makefile.config.example >  Makefile.config
	cp /home/vagrant/Makefile.config /home/vagrant/caffe/Makefile.config

	chown -R vagrant:vagrant /home/vagrant/caffe/

	mkdir /home/vagrant/caffe/build
	cd /home/vagrant/caffe/build
	cmake ..

	make -j2 all
	make -j2 test
	make -j2 runtest
	make install
	cd ../python
	for req in $(cat requirements.txt); do sudo pip install $req; done
	ln -s /home/vagrant/caffe/python/caffe  /usr/lib/python2.7/dist-packages/caffe
	sudo pip install jupyter


	# stupid opencv thing?
	sudo ln /dev/null /dev/raw1394

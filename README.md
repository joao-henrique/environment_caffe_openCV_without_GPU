# environment_caffe_openCV_without_GPU
Password for access ssh: vagrant


Ambiente de desenvolvimento para a disciplina DAS(Desenvolvimento Avançado de Software), instalado:
- Caffe
- OpenCV
- Jupyter Notebook


Prerequisites:
- Virtualbox
- Vagrant



Installing Virtualbox:
```
$ sudo apt-get install virtualbox
```

Installing Vagrant:

```
$ sudo apt-get install vagrant
```


Clone repository and access folder :
```
$ git clone https://github.com/joao-henrique/environment_caffe_openCV_without_GPU.git
$ cd environment_caffe_openCV_without_GPU
```

Starting vagrant

```
$ cd environment_caffe_openCV_without_GPU
$ vagrant up

```

Accessing VM
```
$ vagrant ssh
```
Password for access ssh: vagrant

After success in access
```
$ cd caffe/examples
$ Jupyter notebook --ip=0.0.0.0
```

In your browser access : localhost:8888

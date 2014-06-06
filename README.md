This repo provides a template Vagrantfile to create a CoreOS virtual machines cluster. 
After setup is complete you will have 3 CoreOS virtual machines running on your local machine forming a cluster.

1) Install dependencies

* [virtualbox] 4.0 or greater.
* [vagrant] 1.5 or greater.

2) Clone this project and get it running!

```
git clone https://github.com/mohitarora/coreos-vagrant
cd coreos-vagrant
```

3) Configure Dicovery URL

Generate a new token for your cluster from https://discovery.etcd.io/new and replace the discover URL in user-data file.


4) Startup and SSH

```
vagrant up
```

``vagrant up`` triggers vagrant to download the CoreOS image (if necessary) and (re)launch the instance

beanstalkd-benchmark
====================

A beanstalkd benchmarking tool in Golang

Notes
--------

There are compiled bin files for Linux(64bit) and OSX(64bit) in folder `bin`.

Feel free to use them if you don't have a Golang environment.

Installation
---------------

    # go get github.com/fangli/beanstalkd-benchmark
    # cd $GOPATH/src/github.com/fangli/beanstalkd-benchmark
    # go run beanstalkd_benchmark.go -c=10000 -n=100 -s=512

If you get import error about "github.com/kr/beanstalk", run the following command first:

    # go get github.com/kr/beanstalk

Usage
---------

    Usage of ./beanstalkd_benchmark:

    -h="localhost:11300": Host of beanstalkd, defaults to localhost:11300
    -p=1: Number of concurrent publishers, defaults to 1
    -r=<p>: Number of concurrent readers, defaults to number of publishers
    -n=10000: Counts of jobs to be processed (put, reserved and deleted), defaults to 10000
    -s=256: Size of data, in bytes, defaults to 256
    -d=false: Drain the beanstalk (delete all jobs) before starting the test
    -f=0: Add <f> jobs to the beanstalk (after draining, if specified)
          before starting the test

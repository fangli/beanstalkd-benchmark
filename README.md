beanstalkd-benchmark
====================

A beanstalkd benchmarking tool in Golang

Installation
------------

    # git clone https://github.com/fangli/beanstalkd-benchmark
    # cd beanstalkd-benchmark
    # go run beanstalkd_benchmark.go -c=10000 -n=100 -s=512

If you get import error about "github.com/kr/beanstalk", run the following command first:

    # go get github.com/kr/beanstalk


Usage
-----

    Usage of ./beanstalkd_benchmark:

    -c=1: number of concurrent workers, default to 1
    -h="localhost:11300": Host to beanstalkd, default to localhost:11300
    -n=10000: Counts of push operation in each worker, default to 10000
    -s=256: Size of data

Notes
-----

There are compiled bin files for Linux(64bit) and OSX(64bit) in folder `bin`.

Feel free to use them if you don't have a Golang environment.
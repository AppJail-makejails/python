# Python

Python is an interpreted, interactive, object-oriented, open-source programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later.

wikipedia.org/wiki/Python_(programming_language)

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/960px-Python-logo-notext.svg.png" width="30%" height="auto" alt="Python logo">

## How to use this Makejail

```console
# appjail makejail -j python -f gh+AppJail-makejails/python -o container="args:--pull"
...
# appjail cmd jexec python python
Python 3.11.15 (main, Mar  4 2026, 23:52:19) [Clang 19.1.7 (https://github.com/llvm/llvm-project.git llvmorg-19.1.7-0-gcd7080 on freebsd15
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

### Arguments (stage: build)

* `python_from` (default: `ghcr.io/appjail-makejails/python`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `python_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

## OCI Configuration

```yaml
build:
  variants:
    - tag: 15.1
      containerfile: Containerfile
      aliases: ["latest"]
      default: true
      args:
        FREEBSD_RELEASE: "15.1"
    - tag: 15.1-3
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "3"
    - tag: 15.1-2
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "2"
    - tag: 15.1-27
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "27"
    - tag: 15.1-310
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "310"
    - tag: 15.1-311
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "311"
    - tag: 15.1-312
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "312"
    - tag: 15.1-313
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "313"
    - tag: 15.1-313t
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "313t"
    - tag: 15.1-314
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "314"
    - tag: 15.1-314t
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "314t"
    - tag: 15.1-315
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "315"
```

## Notes

1. The `latest` tag refers to the default version of Python in the FreeBSD ports, not the latest version of Python. 

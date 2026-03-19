# python

Python is an interpreted, interactive, object-oriented, open-source programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later.

wikipedia.org/wiki/Python_(programming_language)

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/960px-Python-logo-notext.svg.png" width="80%" height="auto" alt="python logo">

## How to use this Makejail

```console
# appjail makejail -j python -f gh+AppJail-makejails/python
...
# appjail cmd jexec python python
Python 3.11.15 (main, Mar  4 2026, 23:52:19) [Clang 19.1.7 (https://github.com/llvm/llvm-project.git llvmorg-19.1.7-0-gcd7080 on freebsd15
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

### Arguments

* `python_from` (default: `ghcr.io/appjail-makejails/python`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `python_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

## OCI Configuration

```yaml
build:
  variants:
    - tag: 15.0
      containerfile: Containerfile.pkg
      aliases: ["latest"]
      default: true
      args:
        FREEBSD_RELEASE: "15.0"
    - tag: 15.0-3
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "3"
    - tag: 15.0-2
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "2"
    - tag: 15.0-27
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "27"
    - tag: 15.0-310
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "310"
    - tag: 15.0-311
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "311"
    - tag: 15.0-312
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "312"
    - tag: 15.0-313
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "313"
    - tag: 15.0-313t
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "313t"
    - tag: 15.0-314
      containerfile: Containerfile.pkg
      args:
        FREEBSD_RELEASE: "15.0"
        PYTHON_VERSION: "314"
```

# Python

Python is an interpreted, interactive, object-oriented, open-source programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later.

wikipedia.org/wiki/Python_(programming_language)

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/960px-Python-logo-notext.svg.png" width="30%" height="auto" alt="Python logo">

## How to use this Makejail

### Create a `Containerfile` in your Python app project

```dockerfile
FROM ghcr.io/appjail-makejails/python:15.1-3

WORKDIR /app

COPY requirements.txt ./
RUN python3 -m ensurepip && \
    python3 -m pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "./your-daemon-or-script.py" ]
```

or (if you need to use Python 2):

```dockerfile
FROM ghcr.io/appjail-makejails/python:15.1-2

WORKDIR /app

COPY requirements.txt ./
RUN python2 -m ensurepip && \
    python2 -m pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python2", "./your-daemon-or-script.py" ]
```

You can then build and run the OCI image:

```console
$ buildah build --network=host -t my-python-app .
$ appjail oci run \
    -o overwrite=force \
    -o ephemeral \
    -o alias \
    -o ip4_inherit \
    localhost/my-python-app my-python-app
```

### Run a single Python script

For many simple, single file projects, you may find it inconvenient to write a complete Containerfile. In such cases, you can run a Python script by using the Python Docker image directly:

```console
$ appjail oci run \
    -o overwrite=force \
    -o ephemeral \
    -o alias \
    -o ip4_inherit \
    -o fstab="$PWD /myapp" \
    -w /myapp \
    ghcr.io/appjail-makejails/python:15.1-3 my-python-app \
    python3 your-daemon-or-script.py
```

or (again, if you need to use Python 2):

```console
$ appjail oci run \
    -o overwrite=force \
    -o ephemeral \
    -o alias \
    -o ip4_inherit \
    -o fstab="$PWD /myapp" \
    -w /myapp \
    ghcr.io/appjail-makejails/python:15.1-2 my-python-app \
    python2 your-daemon-or-script.py
```

### OCI image and Makejail

This repository includes a small `Makejail` that ultimately uses the OCI image, in case you prefer to use `appjail-makejail(5)`.

```console
$ appjail makejail \
    -j python \
    -f gh+AppJail-makejails/python \
    -o container="args:--pull"
...
$ appjail cmd jexec python python
Python 3.11.15 (main, Mar  4 2026, 23:52:19) [Clang 19.1.7 (https://github.com/llvm/llvm-project.git llvmorg-19.1.7-0-gcd7080 on freebsd15
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

### Arguments (stage: build)

* `python_from` (default: `ghcr.io/appjail-makejails/python`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `python_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

### Environment (OCI image)

* `PGID` (default: `1000`): Equivalent to `PUID` but for the Process Group ID.
* `PUID` (default: `1000`): Process User ID for the container's main process, allowing you to match the owner of files written to mounted host volumes to your host system's user. Writable volumes are changed based on this environment variable.

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
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-3
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "3"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-2
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "2"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-27
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "27"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-310
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "310"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-311
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "311"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-312
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "312"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-313
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "313"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-313t
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "313t"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-314
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "314"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-314t
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "314t"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
    - tag: 15.1-315
      containerfile: Containerfile
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "315"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
```

## Notes

1. The `latest` tag refers to the default version of Python in the FreeBSD ports, not the latest version of Python. 
2. The ideas present in the Docker image of Python are taken into account for users who are familiar with it.

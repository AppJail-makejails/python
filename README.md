# python

Python is an interpreted, interactive, object-oriented, open-source programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later.

wikipedia.org/wiki/Python_(programming\_language)

![python logo](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/121px-Python-logo-notext.svg.png)

## How to use this Makejail

Create a `Makejail` in your Python app project.

```
INCLUDE options/network.makejail
INCLUDE gh+AppJail-makejails/python

WORKDIR /app
COPY app/

STAGE cmd

WORKDIR /app
ENTRYPOINT %{PYTHON_EXECUTABLE}
RUN main.py
```

Where `options/network.makejail` are the options that suit your environment, for example:

```
ARG network?
ARG interface=python

OPTION virtualnet=${network}:${interface} default
OPTION nat
```

Open a shell and run `appjail makejail`:

```sh
appjail makejail -j pyapp

# or (if you need to use Python 2):
appjail makejail -j pyapp -b PYTHON_MAJOR=2 -b PYTHON_MINOR=7
```

You can open a python shell using the `python_shell` custom stage:

```sh
appjail run -s python_shell pyapp
```

### Build Arguments

* `PYTHON_MAJOR` (default: `3`).
* `PYTHON_MINOR` (optional).
* `PYTHON_TAG_PREFIX` (default: `13.2-`).

## How to build the Images

Make any changes you want to your image.

```
INCLUDE options/network.makejail
INCLUDE gh+AppJail-makejails/python --file build.makejail

SYSRC python_enable=YES
SERVICE python start
```

Build the jail:

```sh
appjail makejail -j python
```

Remove unportable or unnecessary files and directories and export the jail:

```sh
appjail stop python
appjail cmd local python sh -c "rm -f var/log/*"
appjail cmd local python sh -c "rm -f var/cache/pkg/*"
appjail cmd local python sh -c "rm -f var/run/*"
appjail cmd local python vi etc/rc.conf
appjail image export python
```

### Arguments

* `python_major` (optional).
* `python_minor` (optional).

## Tags

| Tag        | Arch    | Version           | Type   | `python_major` | `python_minor` |
| ---------- | ------- | ----------------- | ------ | -------------- | -------------- |
| `13.2`     | `amd64` | `13.2-RELEASE-p1` | `thin` |       -        |        -       |
| `13.2-3`   | `amd64` | `13.2-RELEASE-p1` | `thin` |       3        |        -       |
| `13.2-311` | `amd64` | `13.2-RELEASE-p1` | `thin` |       3        |        11      |
| `13.2-310` | `amd64` | `13.2-RELEASE-p1` | `thin` |       3        |        10      |
| `13.2-39`  | `amd64` | `13.2-RELEASE-p1` | `thin` |       3        |        9       |
| `13.2-38`  | `amd64` | `13.2-RELEASE-p1` | `thin` |       3        |        8       |
| `13.2-2`   | `amd64` | `13.2-RELEASE-p1` | `thin` |       2        |        -       |
| `13.2-27`  | `amd64` | `13.2-RELEASE-p1` | `thin` |       2        |        7       |
| `13-1`     | `amd64` | `13.1-RELEASE-p1` | `thin` |       -        |        -       |
| `13.1-3`   | `amd64` | `13.1-RELEASE-p8` | `thin` |       3        |        -       |
| `13.1-311` | `amd64` | `13.1-RELEASE-p8` | `thin` |       3        |        11      |
| `13.1-310` | `amd64` | `13.1-RELEASE-p8` | `thin` |       3        |        10      |
| `13.1-39`  | `amd64` | `13.1-RELEASE-p8` | `thin` |       3        |        9       |
| `13.1-38`  | `amd64` | `13.1-RELEASE-p8` | `thin` |       3        |        8       |
| `13.1-2`   | `amd64` | `13.1-RELEASE-p8` | `thin` |       2        |        -       |
| `13.1-27`  | `amd64` | `13.1-RELEASE-p1` | `thin` |       2        |        7       |

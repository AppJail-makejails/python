# python

Python is an interpreted, interactive, object-oriented, open-source programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later.

wikipedia.org/wiki/Python_(programming_language)

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
ARG network
ARG interface=python

OPTION virtualnet=${network}:${interface} default
OPTION nat
```

Open a shell and run `appjail makejail`:

```sh
appjail makejail -j pyapp -- --network development

# or (if you need to use Python 2):
appjail makejail -j pyapp -b PYTHON_MAJOR=2 -b PYTHON_MINOR=7 -- --network development
```

You can open a python shell using the `python_shell` custom stage:

```sh
appjail run -s python_shell pyapp
```

### Build Arguments

* `PYTHON_MAJOR` (default: `3`)
* `PYTHON_MINOR` (default: `9`)

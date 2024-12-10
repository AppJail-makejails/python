# python

Python is an interpreted, interactive, object-oriented, open-source programming language. It incorporates modules, exceptions, dynamic typing, very high level dynamic data types, and classes. Python combines remarkable power with very clear syntax. It has interfaces to many system calls and libraries, as well as to various window systems, and is extensible in C or C++. It is also usable as an extension language for applications that need a programmable interface. Finally, Python is portable: it runs on many Unix variants, on the Mac, and on Windows 2000 and later.

wikipedia.org/wiki/Python_(programming\_language)

![python logo](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/121px-Python-logo-notext.svg.png)

## How to use this Makejail

Create a `Makejail` in your Python app project.

```
OPTION start
OPTION overwrite

INCLUDE options/network.makejail

FROM python:13.4

WORKDIR /app
COPY .

STAGE cmd

CMD cd /app; python main.py
```

**Note**: Remember that you can use `INCLUDE gh+AppJail-makejails/python` instead of `FROM python:...` to use arguments, but when using a specific version of python, you need to change the entry point when running a python script.

Where `options/network.makejail` are the options that suit your environment, for example:

```
ARG network?
ARG interface=pyapp

OPTION virtualnet=${network}:${interface} default
OPTION nat
```

Open a shell and run `appjail makejail`:

```sh
appjail makejail -j pyapp
```

### Arguments

* `python_tag` (default: `13.4`): see [#tags](#tags).

## Tags

| Tag        | Arch    | Version        | Type   | `python_major` | `python_minor` |
| ---------- | ------- | -------------- | ------ | -------------- | -------------- |
| `13.4`     | `amd64` | `13.4-RELEASE` | `thin` |      -         |       -        |
| `13.4-3`   | `amd64` | `13.4-RELEASE` | `thin` |     `3`        |       -        |
| `13.4-311` | `amd64` | `13.4-RELEASE` | `thin` |     `3`        |      `11`      |
| `13.4-310` | `amd64` | `13.4-RELEASE` | `thin` |     `3`        |      `10`      |
| `13.4-39`  | `amd64` | `13.4-RELEASE` | `thin` |     `3`        |      `9`       |
| `13.4-38`  | `amd64` | `13.4-RELEASE` | `thin` |     `3`        |      `8`       |
| `13.4-2`   | `amd64` | `13.4-RELEASE` | `thin` |     `2`        |       -        |
| `13.4-27`  | `amd64` | `13.4-RELEASE` | `thin` |     `2`        |      `7`       |
| `14.2`     | `amd64` | `14.2-RELEASE` | `thin` |      -         |       -        |
| `14.2-3`   | `amd64` | `14.2-RELEASE` | `thin` |     `3`        |       -        |
| `14.2-311` | `amd64` | `14.2-RELEASE` | `thin` |     `3`        |      `11`      |
| `14.2-310` | `amd64` | `14.2-RELEASE` | `thin` |     `3`        |      `10`      |
| `14.2-39`  | `amd64` | `14.2-RELEASE` | `thin` |     `3`        |      `9`       |
| `14.2-38`  | `amd64` | `14.2-RELEASE` | `thin` |     `3`        |      `8`       |
| `14.2-2`   | `amd64` | `14.2-RELEASE` | `thin` |     `2`        |       -        |
| `14.2-27`  | `amd64` | `14.2-RELEASE` | `thin` |     `2`        |      `7`       |

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

FROM python:14.3

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

* `python_tag` (default: `14.3`): see [#tags](#tags).
* `python_ajspec` (default: `gh+AppJail-makejails/python`): Entry point where the `appjail-ajspec(5)` file is located.

## Tags

| Tag                                  | Arch    | Version            | Type   | `python_major`    | `python_minor` |
| ------------------------------------ | ------- | ------------------ | ------ | ----------------- | -------------- |
| `14.3`                           | `amd64` | `14.3-RELEASE` | `thin` | -                 | -              |
| `14.3-3`           | `amd64` | `14.3-RELEASE` | `thin` | `3` | -              |
| `14.3-314` | `amd64` | `14.3-RELEASE` | `thin` | `3` | `14`   |
| `14.3-313t` | `amd64` | `14.3-RELEASE` | `thin` | `3` | `13t`   |
| `14.3-313` | `amd64` | `14.3-RELEASE` | `thin` | `3` | `13`   |
| `14.3-312` | `amd64` | `14.3-RELEASE` | `thin` | `3` | `13t`   |
| `14.3-311` | `amd64` | `14.3-RELEASE` | `thin` | `3` | `11`   |
| `14.3-310` | `amd64` | `14.3-RELEASE` | `thin` | `3` | `10`   |
| `14.3-2`                         | `amd64` | `14.3-RELEASE` | `thin` | `2`               | -              |
| `14.3-27`                        | `amd64` | `14.3-RELEASE` | `thin` | `2`               | `7`            |
| `15`                           | `amd64` | `15` | `thin` | -                 | -              |
| `15-3`           | `amd64` | `15` | `thin` | `3` | -              |
| `15-314` | `amd64` | `15` | `thin` | `3` | `14`   |
| `15-313t` | `amd64` | `15` | `thin` | `3` | `13t`   |
| `15-313` | `amd64` | `15` | `thin` | `3` | `13`   |
| `15-312` | `amd64` | `15` | `thin` | `3` | `13t`   |
| `15-311` | `amd64` | `15` | `thin` | `3` | `11`   |
| `15-310` | `amd64` | `15` | `thin` | `3` | `10`   |
| `15-2`                         | `amd64` | `15` | `thin` | `2`               | -              |
| `15-27`                        | `amd64` | `15` | `thin` | `2`               | `7`            |

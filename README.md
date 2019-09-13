# ctfbox
The lighter, leaner, meaner ctfbox, without all the crap

Docker image
----
[![](https://images.microbadger.com/badges/image/epadctf/ctfbox.svg)](https://microbadger.com/images/epadctf/ctfbox "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/epadctf/ctfbox.svg)](https://microbadger.com/images/epadctf/ctfbox "Get your own version badge on microbadger.com")

Build
----

[![Build Status](https://dockerbuildbadges.quelltext.eu/status.svg?organization=epadctf&repository=ctfbox)](https://hub.docker.com/r/epadctf/ctfbox/)


Installation/ Build
=====================

Pull the image from dockerhub using

```bash
docker pull epadctf/ctfbox
```

or build it yourself

```bash
git clone https://github.com/epadctf/ctfbox.git
cd ctfbox
docker build -t epadctf/ctfbox .
```

Run the ctfbox
================

Start the image

```bash
docker run -it epadctf/ctfbox
```

If you have problems with gdb or gdbserver you can run the container in privileged mode and with the host network.

```bash
sudo docker run -it --privileged --net=host epadctf/ctfbox
```

# gosu and tini in one docker image

```
root@rocks:~# docker run -it -e GOSU_USER=nobody jahrik/arm-gosu-tini:aarch64 bash
nobody@a1be06e5d4b9:/$ ps waux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nobody       1  2.6  0.0   1812   356 pts/0    Ss   00:52   0:00 tini bash
nobody      12  0.0  0.0   3776  2892 pts/0    S    00:52   0:00 bash
nobody      15  0.0  0.0   5288  2272 pts/0    R+   00:53   0:00 ps waux
```

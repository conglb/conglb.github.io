---
layout: post
title: "Facts and Tips in Unix enviroment"
---

After a few years of using Ubuntu, Debian, I find these little facts that usually misundertood. 

1. root permission do not source `.bashrc`.
Also, crontab run task without sourcing the `.bashrc`.
Explain: crontab use `/bin/sh` not `/bin/bash`.
2. To see crontab running history,
```
grep CRON /var/log/syslog
```
Explain: find all "CRON" lines in syslog.

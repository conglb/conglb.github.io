

### Situation when work with Github

Error:
```
error: RPC failed; HTTP 400 curl 22 The requested URL returned error: 400
send-pack: unexpected disconnect while reading sideband packet
fatal: the remote end hung up unexpectedly
Everything up-to-date
```

Solution:
```
git config http.postBuffer 524288000
```

This command includes the buffer size


Error: Can not checkout
```
Please move or remove them before you switch branches.
```

Solution:
```
git reset --hard
git clean -fd
git checkout <branch-name>
```





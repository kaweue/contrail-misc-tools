## Recommended usage:

```bash
docker build . -t operator-sdk
docker run -it -v ~/project_dir:/project operator-sdk bash
$ cd /project
$ operator-sdk generate openapi
```

## Build custom Operator
```bash
docker build . -t operator-sdk
docker run -it -v ~/project_dir:/project_dir -v /var/run/docker.sock:/var/run/docker.sock operator-sdk bash
$ cd /project_dir
$ operator-sdk build operator_name
```

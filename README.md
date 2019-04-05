# docker-baidupcs

## Usage

1. 
```
docker run \
    -d \
    --restart="unless-stopped" \
    --name="baidupcs" \
    -v "<path to downloads>:/downloads" \
    -v "<path to config>:/config" \
    -e PGID=<gid> -e PUID=<uid> \
    -e TZ=<timezone> \
    -e PORT=5299 \ # (port should be greater than 1024)
    -p 5299:5299 \
    melsonlai/docker-baidupcs:latest
```
2. Config the download path with your browser to `/downloads'. 


### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
$ id <dockeruser>
  uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Tags

+ latest: Manifest list with `amd64`
+ amd64: amd64 arch based on `lsiobase/alpine:latest`

## Versions

+ **3.6.4:** Update 3.6.4
+ **20190315**: Fork from Auska/docker-baidupcs
+ **20190323**: Update BaiduPCS to v3.6.5
+ **20190403**: Update BaiduPCS to v3.6.6
+ **20190405**: Add script to auto download the latest `liuzhuoling2011/baidupcs-web` release

## References

+ https://www.github.com/Auska/docker-baidupcs
+ https://github.com/liuzhuoling2011/baidupcs-web
+ https://github.com/iikira/BaiduPCS-Go

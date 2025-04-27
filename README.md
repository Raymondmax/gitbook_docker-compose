## Run gitbook
```bash
docker compose up -d
ln -s /var/lib/docker/volumes/gitbook_docker-compose_source/_data ./source
```
## Add Chapter
```md
# vi ./book/chapter1.md
# Chapter1
Start using the gitbook
```
```md
# vi ./book/SUMMARY.md
# Summary

* [简介](README.md)
* [第一章：开始](chapter1.md)
```
```bash
docker compose build
docker compose up -d
```

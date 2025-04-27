## Run gitbook
```bash
docker compose up -d
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

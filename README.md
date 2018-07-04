# docker-mdview

```cmd
rmdir /s /q work
docker run --rm -v %cd%:/work nuitsjp/mdview:local /bin/sh -c "cd /work && mdview-init.sh work"
```
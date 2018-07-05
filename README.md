# docker-mdview

```cmd
rmdir /s /q work
docker run --rm -v %cd%:/work nuitsjp/mdview:local /bin/sh -c "cd /work && mdview-init.sh work"
```

```cmd
docker run --rm -v %cd%\work:/work nuitsjp/mdview:local /bin/sh -c "cd /work && review-pdfmaker.sh config.yml"
```

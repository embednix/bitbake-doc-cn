## How compile on your local Linux system

1. install the packages needed to compile the materials (example on Ubuntu 22.04):

```
sudo apt install make git texlive-latex-base \
texlive-latex-extra texlive-font-utils dia \
python3-pygments texlive-fonts-recommended \
texlive-fonts-extra texlive-xetex texlive-extra-utils \
fonts-inconsolata fonts-liberation xfonts-scalable \
lmodern texlive-science texlive-plain-generic \
texlive-lang-french ghostscript texlive-bibtex-extra biber tex-gyre \
texlive-lang-chinese
```
2. install the Chinese fonts required by ElegantBook LaTex Template (https://github.com/ElegantLaTeX/ElegantBook)

The font info can be found in https://github.com/ElegantLaTeX/ElegantBook/blob/master/elegantbook-cn.tex by searching "njy9"

3. run "make" in the cloned repository. 

```
bitbake-doc-cn$ make 
```

4. run "make clean" to clean

```
bitbake-doc-cn$ make clean
``` 

## How to ompile with Docker Ubuntu Images

Refer to `utils/docker/Dockerfile` for details

1. in the root directory of your cloned repository
```
bitbake-doc-cn$ docker build -t bitbake-doc-cn utils/docker
```
```
bitbake-doc-cn$ docker run -it -u $(id -u):$(id -g) -v $(pwd):/bitbake-doc-cn --rm bitbake-doc-cn make clean && make
```
if you see errors like this:
```
groups: cannot find name for group ID 1000", try following command
```
run this command to retry:
```
docker run -it -u $(id -u):$(id -g) -v $(pwd):/bitbake-doc-cn -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro --rm bitbake-doc-cn make clean && make
```


## Compiling issues

always try "make clean" then "make" again

## ElegentBook Template issue

please visit https://github.com/ElegantLaTeX/ElegantBook or https://ctan.org/pkg/elegantbook for more information about the  ElegantBook LaTex Template used by this document.

## Report issue

Please report all the issues using the github "Issues" link.
 
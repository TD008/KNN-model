# KNN-model
Pytorch custom implementation of KNN and also using sklearn

## Docker
- I wasn't keen on installing Anaconda directly, but I wanted to try it out along
with Jupyter, so I used a Docker container instead.

- If you have Docker installed, you build the container it with this command
``` sh
docker build -t anaconda-jupyter ./
```
* Note that you can change "anaconda-jupyter" to whatever you would like the name to be
* Also note that I have the vim extension installed wiht jupyter in this container,
so you might want to remove that line if you're not the vim kind

- Once you've built the container, you can use this command to launch it 

``` sh
docker run -p 8888:8888 -v ./:/workspace anaconda-jupyter
```
* note here that if port 8888 is already used on your machine for some reason,
you'll want to change that.

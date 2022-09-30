FROM python:3.10
#image on which we lean on( name of libr and its version)
# changebale enviramant

# its created by us variable environment
ENV PYTHONUNBUFFERED=1

# ARG its also variable environment actve only at the moment of assembly
#and in it we can set the value of a variable and use rhis var (need it when we use var offten)
ARG WORKDIR=/wd
ARG USER=user

# workdir its working derictory, from which we implam comman (in terminal)
WORKDIR ${WORKDIR}
# here we use command on bash
# creat user without password and its directory
RUN useradd --system ${USER} && \
    chown --recursive ${USER} ${WORKDIR}


# here we updated needed libraries
RUN apt update && apt upgrade -y
# than we copy files from project to ressable the image
# to know what to copy we need file context of ressamble docker-compose.yml
COPY --chown=${USER} requirements.txt requirements.txt
# firstly we copy files requirements and than copy all others

#than install all what in req file
RUN pip install --upgrade pip && \
    pip install --requirement requirements.txt

#than copy all others, and in it we show that new owner its USER
COPY --chown=${USER} ./app.py app.py
#COPY --chown=${USER} ./application application

# here we reconnect to created user and we act on behaf of the user
USER ${USER}

# here we show what to run
ENTRYPOINT ["python", "app.py"]
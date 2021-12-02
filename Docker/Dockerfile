FROM debian:bullseye

COPY ./Docker . 
RUN ls -a

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install -r ./requirements.txt
RUN chmod +x ./runfile.sh
RUN ./runfile.sh
EXPOSE 8866

LABEL org.opencontainers.image.source=https://github.com/ProgramComputer/solvexmatrix


ENTRYPOINT voila --no-browser ./solvex.ipynb

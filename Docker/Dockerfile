FROM debian:bullseye

COPY ./Docker . 

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install -r ./requirements.txt
RUN chmod +x ./runfile.sh
RUN ./runfile.sh
LABEL org.opencontainers.image.source=https://github.com/ProgramComputer/solvexmatrix

EXPOSE 8866
ENTRYPOINT voila --no-browser ./solvex.ipynb

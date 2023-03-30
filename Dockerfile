FROM gcc:latest
WORKDIR /app
ENV RASP=/app
COPY . .
RUN make 
ENTRYPOINT ["./bin/rasp_fd"]
CMD ["-e", "all", "-p", "example/1Z43.pdb"]

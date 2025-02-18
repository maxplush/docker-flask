FROM ubuntu:22.04  # Use the latest stable Ubuntu version

LABEL maintainer="Max Plush <mplush@pitzer.edu>"

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

WORKDIR /app

# Copy the requirements file to the container
COPY ./requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Copy the rest of the application files
COPY . /app

# Command to run the application
ENTRYPOINT ["python3"]
CMD ["app.py"]

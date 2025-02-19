FROM ubuntu:16.04

LABEL MaxPlush="mplush@pitzer.edu"

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# Copy the requirements file to the container
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN python -m pip install --upgrade pip==20.2.4

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application files
COPY . /app

# Command to run the application
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]

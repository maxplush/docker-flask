FROM ubuntu

LABEL MaxPlush="mplush@pitzer.edu"

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

# Copy the requirements file to the container
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

# Install Python dependencies
RUN python3 -m venv venv
RUN venv/bin/pip install -r requirements.txt

# Copy the rest of the application files
COPY . /app

ENV PATH="/app/venv/bin:$PATH"

# Command to run the application
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]

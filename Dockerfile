FROM ubuntu:16.04

LABEL MaxPlush="mplush@pitzer.edu"

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# Copy the requirements file to the container
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

# Install Python dependencies
#RUN python -m venv venv
#RUN venv/bin/pip install -r requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application files
COPY . /app

# ENV PATH="/app/venv/bin:$PATH"

# Command to run the application
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]

# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Install dependencies with Poetry
COPY pyproject.toml /app/
COPY poetry.lock /app/
RUN /root/.poetry/bin/poetry install --no-interaction

# Copy the rest of the application
COPY . /app/

# Expose the app on port 5000
EXPOSE 5000

# Command to run the application
CMD ["/root/.poetry/bin/poetry", "run", "python", "app.py"]

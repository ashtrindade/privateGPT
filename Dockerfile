FROM python:3

WORKDIR /usr/src/app

# ADD models

COPY requirements.txt ./
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org --no-cache-dir -r requirements.txt

COPY . .
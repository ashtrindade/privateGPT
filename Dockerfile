FROM python:3

# setup dir
WORKDIR /usr/src/app

# download models
ADD https://gpt4all.io/models/ggml-gpt4all-j-v1.3-groovy.bin /usr/src/app/models

ADD https://huggingface.co/Pi3141/alpaca-native-7B-ggml/resolve/397e872bf4c83f4c642317a5bf65ce84a105786e/ggml-model-q4_0.bin /usr/src/app/models

# install dependencies
COPY requirements.txt ./
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org --no-cache-dir -r requirements.txt

# copy files
COPY . .
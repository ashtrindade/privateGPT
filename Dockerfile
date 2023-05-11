FROM python:3

# setup dir
WORKDIR /usr/src/app

# download models
RUN wget https://gpt4all.io/models/ggml-gpt4all-j-v1.3-groovy.bin
RUN mv ggml-gpt4all-j-v1.3-groovy.bin /models

RUN wget https://huggingface.co/Pi3141/alpaca-native-7B-ggml/resolve/397e872bf4c83f4c642317a5bf65ce84a105786e/ggml-model-q4_0.bin
RUN mv ggml-model-q4_0.bin /models

# install dependencies
COPY requirements.txt ./
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org --no-cache-dir -r requirements.txt

# copy files
COPY . .
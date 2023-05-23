FROM ubuntu:20.04

RUN apt-get update -qq && apt-get -u upgrade && apt-get install -y \
    python3 \
    python-is-python3 \
    pip \
    wget

COPY requirements.txt ./

RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org --no-cache-dir -r requirements.txt

WORKDIR /home/	    

RUN mkdir models \
    && cd models \
    && wget --no-check-certificate https://gpt4all.io/models/ggml-gpt4all-j-v1.3-groovy.bin \
    && wget --no-check-certificate https://huggingface.co/Pi3141/alpaca-native-7B-ggml/resolve/397e872bf4c83f4c642317a5bf65ce84a105786e/ggml-model-q4_0.bin \
    && cd ..

COPY . .

CMD ["bash"]
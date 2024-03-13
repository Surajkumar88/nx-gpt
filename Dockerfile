FROM ubuntu:20.04
USER root
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y vim curl htop wget
RUN apt-get install -y openjdk-17-jdk 
RUN apt-get install -y python3-pip
RUN wget https://github.com/nutanix/nai-llm/archive/refs/tags/v0.3.tar.gz
ENV WORK_DIR=/nai_llm_0.3
RUN mkdir $WORK_DIR
RUN tar -xvf /v0.3.tar.gz -C $WORK_DIR --strip-components=1
WORKDIR /nai_llm_0.3/llm
RUN pip install -r $WORK_DIR/llm/requirements.txt
RUN mkdir model_path mar_output
RUN pip install torch-model-archiver
RUN sed -i -e "s/6fdf2e60f86ff2481f2241aaee459f85b5b0bbb9/8cca527612d856d7d32bd94f8103728d614eb852/g" $WORK_DIR/llm/model_config.json
RUN python3 $WORK_DIR/llm/generate.py --model_name llama2_7b --model_path /nai_llm_0.3/llm/model_path \
    --mar_output /nai_llm_0.3/llm/mar_output --hf_token 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
RUN bash $WORK_DIR/llm/run.sh -n llama2_7b -a /nai_llm_0.3/llm/mar_output

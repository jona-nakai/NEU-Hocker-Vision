FROM python:3.12
WORKDIR /app

# 
ARG TORCH_VARIANT=cpu
ENV TORCH_VARIANT=${TORCH_VARIANT}

COPY requirements.txt ./

RUN if [ "$TORCH_VARIANT" = "cuda" ] ; then \
        pip install --no-cache-dir torch torchvision \
            --index-url https://download.pytorch.org/whl/cu126 && \
        pip install --no-cache-dir -r requirements.txt ; \
    else \
        pip install --no-cache-dir -r requirements.txt ; \
    fi

COPY . .

CMD ["python", "yolo_inference.py"]
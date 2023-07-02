# eli5_img:2.0

FROM pip_img:1.0

WORKDIR /app

COPY ./components_repo1/test-component2_repo1/requirements.txt .

RUN pip install -r requirements.txt

ENTRYPOINT ["/bin/sh", "-c", "while true; do sleep 5; done"]

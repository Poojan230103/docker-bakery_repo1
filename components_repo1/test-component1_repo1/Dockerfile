# eli5_img:1.0

FROM pip_img:1.0

WORKDIR /app

COPY ./components_repo1/test-component1_repo1/requirements.txt .

RUN apt-get update && apt-get install -y bash

RUN pip install -r requirements.txt

ENTRYPOINT ["bash", "-c", "while true; do echo hello; sleep 5; done"]

# testing manual sync on repo1-component1

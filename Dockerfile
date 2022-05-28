
   
FROM python:3.8

RUN pip install fastapi uvicorn spacy
RUN python -m spacy download en_core_web_sm

COPY . /api/api

ENV PYTHONPATH=/api
WORKDIR /api

EXPOSE 8000

ENTRYPOINT ["uvicorn"]
CMD ["api.text_anonymization:app", "--host", "0.0.0.0"]
FROM nhsdigitalmait/tkw-x:20200703
RUN useradd -rm -u 1001 service
RUN mkdir /home/service/data/ && chown service:service /home/service/data/
VOLUME /home/service/data
VOLUME /home/service/fhir
VOLUME /home/service/certs
COPY . /home/service/TKW/config/FHIR_ReasonableAdjustments
WORKDIR /home/service/TKW/config/FHIR_ReasonableAdjustments
RUN sh set-all-configurations.sh

ENV trustStore=default
ENV trustStorePassword=default
ENV keyStore=default
ENV keyStorePassword=default
USER service
CMD ["bash", "runtkwfhirvalidator.sh"]


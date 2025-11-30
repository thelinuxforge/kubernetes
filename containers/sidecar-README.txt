An example of a sidecar container is a logging sidecar that helps manage application logs independently of the main application container.

Scenario:
You have a web application running in a container. Instead of writing logs directly to the disk or managing logging within the app, you can offload this to a sidecar container.

Example: Fluentd Sidecar for Log Forwarding
In this example, the sidecar container runs Fluentd, a log-forwarding agent. The main application container writes logs to a shared volume, and the Fluentd sidecar reads from this volume and forwards the logs to an external logging service like Elasticsearch, CloudWatch, or Splunk.

apiVersion: v1
kind: Pod
metadata:
  name: app-with-logging-sidecar
spec:
  containers:
  - name: web-app
    image: nginx:alpine
    volumeMounts:
    - name: shared-logs
      mountPath: /var/log/app  # Web app writes logs here
  - name: fluentd-sidecar
    image: fluentd:stable
    volumeMounts:
    - name: shared-logs
      mountPath: /var/log/app  # Fluentd reads logs from the same path
    resources:
      limits:
        cpu: "100m"
        memory: "200Mi"
    env:
    - name: CASSANDRA
      value: "nginx.default.svc.cluster.local"
    - name: FLUENT_ELASTICSEARCH_PORT
      value: "9200"
  volumes:
  - name: shared-logs
    emptyDir: {}

How it works:
Main Application Container (web-app): Runs an Nginx server (or any other app). It writes logs to the /var/log/app directory.
Sidecar Container (fluentd-sidecar): Fluentd runs in parallel with the main application, collecting logs from the shared volume (/var/log/app) and forwarding them to an external service (e.g., Elasticsearch).

Benefits of using a Sidecar in this case:
Separation of Concerns: The application doesn’t need to manage log forwarding or other concerns like monitoring.
Scalability: You can update or replace the logging mechanism independently of the main application.
Portability: Log processing is decoupled, so you can easily change the logging service without modifying the application.
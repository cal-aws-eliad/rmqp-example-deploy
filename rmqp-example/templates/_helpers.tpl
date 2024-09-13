{{- define "rmqp-example.testConnection" -}}
{{- if .Values.testConnection.enabled }}
{{- include "test/job-test-connection.yaml" . }}
{{- end }}
{{- end }}

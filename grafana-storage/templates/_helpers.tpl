{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "grafana-storage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "grafana-storage.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "grafana-storage.labels.selector" -}}
app: {{ template "grafana-storage.name" . }}
group: {{ .Values.grafanaStorage.labels.group }}
provider: {{ .Values.grafanaStorage.labels.provider }}
{{- end -}}

{{- define "grafana-storage.labels.stakater" -}}
{{ template "grafana-storage.labels.selector" . }}
version: "{{ .Values.grafanaStorage.labels.version }}"
{{- end -}}

{{- define "grafana-storage.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}

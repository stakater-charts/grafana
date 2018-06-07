{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "grafana.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "grafana.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "grafana.labels.selector" -}}
app: {{ template "grafana.name" . }}
group: {{ .Values.grafana.labels.group }}
provider: {{ .Values.grafana.labels.provider }}
{{- end -}}

{{- define "grafana.labels.stakater" -}}
{{ template "grafana.labels.selector" . }}
version: "{{ .Values.grafana.labels.version }}"
{{- end -}}

{{- define "grafana.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}

{{/*
Generates an image string from the input list.
*/}}
{{- define "common.imageGenerator" -}}
  {{- $root       := index . 0 -}}
  {{- $registry   := index . 1 -}}
  {{- $name       := index . 2 -}}
  {{- $tag        := index . 3 -}}

  {{- $registry   := default $root.Values.global.image.registry $registry -}}
  {{- $tag        := default "latest" $tag -}}
  {{- if $registry -}}{{- printf "%s/" $registry -}}{{- end -}}
  {{- printf "%s:%s" $name $tag -}}
{{- end -}}

{{/*
The image for the configmap watcher.
*/}}
{{- define "grafana.configmapwatcher.image" -}}
  {{- $image := .Values.grafana.deployment.configmapWatcher.image -}}
  {{- $params := list . $image.registry $image.name $image.tag -}}
  {{- include "common.imageGenerator" $params -}}
{{- end -}}

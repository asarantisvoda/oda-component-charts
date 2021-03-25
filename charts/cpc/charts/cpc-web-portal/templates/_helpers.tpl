{{/*
Expand the name of the chart.
*/}}
{{- define "cpc-web-portal.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cpc-web-portal.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cpc-web-portal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cpc-web-portal.labels" -}}
helm.sh/chart: {{ include "cpc-web-portal.chart" . }}
{{ include "cpc-web-portal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
oda.tmforum.org/componentName: whalecloud-cpc-productcatalog
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cpc-web-portal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cpc-web-portal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
zcm-app: {{ include "cpc-web-portal.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cpc-web-portal.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "cpc-web-portal.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
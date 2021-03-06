{{/*
Expand the name of the chart.
*/}}
{{- define "apig-all-core.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "apig-all-core.fullname" -}}
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
{{- define "apig-all-core.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "apig-all-core.labels" -}}
helm.sh/chart: {{ include "apig-all-core.chart" . }}
{{ include "apig-all-core.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
oda.tmforum.org/componentName: whalecloud-cpc-productcatalog
{{- end }}

{{/*
Selector labels
*/}}
{{- define "apig-all-core.selectorLabels" -}}
app.kubernetes.io/name: {{ include "apig-all-core.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
zcm-app: {{ include "apig-all-core.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "apig-all-core.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "apig-all-core.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
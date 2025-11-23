
{{/*
Generate a name that is unique for this chart.
This is used for Deployment/Service names when you want consistent naming.
*/}}
{{- define "openwallet-backend.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified name: release-name + chart name
*/}}
{{- define "openwallet-backend.fullname" -}}
{{- if .Values.backend.fullnameOverride }}
{{- .Values.backend.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "openwallet-backend.name" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{/*
Standard chart labels.
These will be added to Deployments, Services, ConfigMaps, etc.
*/}}
{{- define "openwallet-backend.labels" -}}
app.kubernetes.io/name: {{ include "openwallet-backend.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels (should match Deployment `matchLabels`)
name = “이 서비스가 누구인가?” (정체성)
instance = “이 서비스가 어디에 배포되었는가?” (환경/소속/릴리즈)
*/}}
{{- define "openwallet-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openwallet-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


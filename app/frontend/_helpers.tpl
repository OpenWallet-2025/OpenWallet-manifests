
{{/*
Generate a name that is unique for this chart.
This is used for Deployment/Service names when you want consistent naming.
*/}}
{{- define "openwallet-frontend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified name: release-name + chart name
*/}}
{{- define "openwallet-frontend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "openwallet-frontend.name" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{/*
Standard chart labels.
These will be added to Deployments, Services, ConfigMaps, etc.
*/}}
{{- define "openwallet-frontend.labels" -}}
app.kubernetes.io/name: {{ include "openwallet-frontend.name" . }}
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
{{- define "openwallet-frontend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openwallet-frontend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


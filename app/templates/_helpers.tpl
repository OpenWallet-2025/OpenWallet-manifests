{{- define "openwallet.fullname" -}}
{{ include "openwallet.name" . }}
{{- end -}}

{{- define "openwallet.name" -}}
{{ .Chart.Name }}
{{- end -}}

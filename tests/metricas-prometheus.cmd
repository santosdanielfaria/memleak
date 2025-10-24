source ./env

curl -s $URL/actuator/prometheus | grep -E "jvm_gc_pause_seconds_count|vm_memory_used_bytes"

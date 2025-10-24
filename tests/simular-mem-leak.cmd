
source ./env

# Deve retornar: Allocated ~10 MB total.
curl $URL/leak?mb=10

while true; do curl -s $URL/leak?mb=10; sleep 1; done


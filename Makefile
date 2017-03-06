# Makefile
# Dockerfile を生成する

.PHONY: all
.PHONY: dockerfiles


all: dockerfiles


TAGS = opensuse-tumbleweed opensuse-latest opensuse-42.1 opensuse-13.2

dockerfiles:
	for TAG in $(TAGS); do \
	  mkdir -p $${TAG}; \
	  cat "Dockerfile.base.$${TAG}" \
	      "Dockerfile.common" \
	      > $${TAG}/Dockerfile; \
	  if [ -f "Dockerfile.package.$${TAG}" ]; then \
	    cat "Dockerfile.package.$${TAG}" \
	        >> $${TAG}/Dockerfile; \
	  fi; \
	  cat "Dockerfile.common.end" \
	      >> $${TAG}/Dockerfile; \
	done

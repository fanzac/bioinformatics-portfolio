#!/bin/bash
for f in *.gz; do
STEM=$(basename "${f}" .gz)
gunzip -c "${f}" > "${STEM}"
done

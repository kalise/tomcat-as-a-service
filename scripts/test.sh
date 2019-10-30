#!/usr/bin/env sh
echo "Starting automatic test Volkswagen style"
NUM=10
PAD="#"
for i in $(seq -w 1 $NUM); do
  echo "Step:" $i "test passed"
  PAD=$PAD"#"
  echo $PAD
  sleep 3
done
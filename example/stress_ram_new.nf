params.memoryLimit="4 GB"
params.secondLim="30 GB"
params.thirdLim="10 GB"
params.fourthLim="24 GB"
params.numberOfTasks=100

process ram_test_1 {

  memory params.memoryLimit

  input:
    val x

  shell:
  '''
  stress-ng --vm 1 --vm-bytes $(echo "!{task.memory}" | cut -f 1 -d ' ')G --timeout 20s
  stress-ng --vm 1 --vm-bytes $(echo "!{params.secondLim}" | cut -f 1 -d ' ')G --timeout 20s
  '''
}

process ram_test_2 {

  memory params.memoryLimit
  tag "test: wildcard"

  input:
    val x

  shell:
  '''
  stress-ng --vm 1 --vm-bytes $(echo "!{task.memory}" | cut -f 1 -d ' ')G --timeout 10s
  sleep 30
  stress-ng --vm 1 --vm-bytes $(echo "!{params.secondLim}" | cut -f 1 -d ' ')G --timeout 10s
  sleep 10
  stress-ng --vm 1 --vm-bytes $(echo "!{params.thirdLim}" | cut -f 1 -d ' ')G --timeout 20s
  sleep 10
  stress-ng --vm 1 --vm-bytes $(echo "!{params.fourthLim}" | cut -f 1 -d ' ')G --timeout 30s
  '''
}

process ram_test_3 {

  memory params.memoryLimit
  tag "singletag"
  input:
    val x

  shell:
  '''
  stress-ng --vm 1 --vm-bytes $(echo "!{task.memory}" | cut -f 1 -d ' ')G --timeout 35s
  sleep 30
  stress-ng --vm 1 --vm-bytes $(echo "!{params.secondLim}" | cut -f 1 -d ' ')G --timeout 25s
  '''
}

workflow {
  channel.from(0..params.numberOfTasks) | (ram_test_1 & ram_test_2 & ram_test_3)
}

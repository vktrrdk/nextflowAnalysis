params.memoryLimit="4 GB"


process ram_100 {

  memory params.memoryLimit

  input:
    val x

  shell:
  '''
  stress-ng --vm 1 --vm-bytes $(echo "!{task.memory}" | cut -f 1 -d ' ')G --timeout 20s
  '''
}

process ram_50 {

  memory params.memoryLimit

  input:
    val x

  shell:
  '''
  stress-ng --vm 1 --vm-bytes $(echo "!{task.memory}" | cut -f 1 -d ' ')G --timeout 10s
  sleep 10
  '''
}

process ram_25 {

  memory params.memoryLimit

  input:
    val x

  shell:
  '''
  stress-ng --vm 1 --vm-bytes $(echo "!{task.memory}" | cut -f 1 -d ' ')G --timeout 5s
  sleep 15
  '''
}

workflow {
  channel.from(0..0) | (ram_100 & ram_50 & ram_25)
}

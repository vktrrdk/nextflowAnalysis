params.cpuLimit=4


process cpu_100 {

  cpus params.cpuLimit

  input:
    val x

  shell:
  """
  stress-ng --cpu !{task.cpus} --timeout 20s
  """
}

process cpu_50 {

  cpus params.cpuLimit

  input:
    val x

  shell:
  """
  stress-ng --cpu !{task.cpus} --timeout 10s
  sleep 10
  """
}

process cpu_25 {

  cpus params.cpuLimit

  input:
    val x

  shell:
  """
  stress-ng --cpu !{task.cpus} --timeout 5s
  sleep 15
  """
}

workflow {
  channel.from(0..0) | (cpu_100 & cpu_50 & cpu_25)
}

params.numberOfTasks = 1200

process sleep {
  input:
    val x

  """
  sleep 0.1
  """
}

workflow {
  channel.from(0..params.numberOfTasks) | sleep
}

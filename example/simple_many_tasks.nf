params.numberOfTasks = 2500

process sleep {
  input:
    val x

  """
  sleep 5
  """
}

workflow {
  channel.from(0..params.numberOfTasks) | sleep
}

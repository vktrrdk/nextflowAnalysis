process sleep {
  input:
    val x

  """
  sleep 5
  """
}

workflow {
  channel.from(0..200) | sleep
}

# Example scripts

## Stress cpu

### Requirement

stress-ng must be available on the system

### Parameter

`--cpuLimit` defines the number of cpus available for a process.

### Simulation

The `stress_cpu.nf` runs three Nextflow processes. These processes consume 25, 50 and 100 percent of the running time (20s) all
available cpus.

## Stress memory

### Requirement

stress-ng must be available on the system

### Parameter

`--memoryLimit` defines the memory size available for a process.

### Simulation

The `stress_ram.nf` runs three Nextflow processes. These processes consume 25, 50 and 100 percent of the running time (20s) the provided RAM (default: 4GB).

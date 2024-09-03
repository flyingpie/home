# List containers - Short version.
function dps() {
	& "docker" ps --all --format "table {{.Names}}\t{{.Status}}\t{{.RunningFor}}"
}

# List containers - Long version.
function dpss() {
	& "docker" ps --all --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.RunningFor}}\t{{.Ports}}"
}

# Show Docker stats.
function ds() {
	& "docker" stats --all --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"
}

# List nodes.
function dnls() {
	docker node ls
}

# List nodes with labels.
function dnlabels() {
	$nodes = docker node ls --format "{{ .ID }}"

	foreach ($node in $nodes) {
		docker node inspect --format "{{ .Spec.Labels }}" $node
	}
}

# List services.
function dsls() {
	docker service ls --format "table {{.ID}}\t{{.Name}}\t{{.Mode}}\t{{.Replicas}}"
}

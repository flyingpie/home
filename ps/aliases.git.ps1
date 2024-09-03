# List branches, local only.
function gitb() {
	& "git" branch
}

# List branches, including remote ones.
function gitba() {
	& "git" branch -a
}

# Checkout.
function gitc($branch) {
	& "git" checkout $branch
}

# Reset changes and remove files not in the repository.
function gitcl() {
	& "git" reset --hard # --hard -> Reset index and working tree
	& "git" clean -fdx # -f -> Also delete, -d -> Also delete untracked directories, -x -> Don't use .gitignore rules
	& "git" remote prune origin
}

# Show git logs.
function gitl() {
	if ($args[0]) {
		& "git" log -n $args[0]
	}
	else {
		& "git" log -n 6
	}
}

# Merge branch into current one.
function gitm($branch) {
	& "git" merge $branch
}

# Pull.
function gitp() {
	& "git" pull
}

# Push.
function gitpu() {
	$branch = (& "git" symbolic-ref --short HEAD) | Out-String
	$branch = $branch.Trim()

	& "git" push --set-upstream origin $branch
}

# Pull and clean.
function gitpcl() {
	gitp
	gitcl
}

# Git status.
function gits() {
	& "git" status
}

# Set upstream branch to origin/<current_branch>.
function gitup() {
	$branch = (& "git" symbolic-ref --short HEAD) | Out-String
	$branch = $branch.Trim()

	& "git" branch --set-upstream-to="origin/$branch"
}

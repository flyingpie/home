-- ~/.config/yazi/init.lua
function Linemode:size_and_mtime()
	-- Modified Time
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	else
		time = os.date("%Y-%M-%d %H:%m", time)
	end

	-- Size
	local size = self._file:size()
	size = size and ya.readable_size(size) or "-"

	-- Permissions
	local perm = self._file.cha:perm() or ""

	-- Owner
	local user = ya.user_name and ya.user_name(self._file.cha.uid) or self._file.cha.uid
	local group = ya.group_name and ya.group_name(self._file.cha.gid) or self._file.cha.gid

	return string.format(
		"%s %7s %s %s %s",
		perm,
		size,
		user,
		group,
		time
	)
end

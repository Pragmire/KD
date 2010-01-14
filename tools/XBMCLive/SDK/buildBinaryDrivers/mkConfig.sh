
makeConfig()
{
	CATEGORIES="main restricted universe multiverse"

	configString=""
	configString="$configString --distribution karmic"
	configString="$configString --mirror-chroot-security http://security.ubuntu.com/ubuntu/"
	configString="$configString --mirror-binary-security http://security.ubuntu.com/ubuntu/"

	if [ -n "$APT_HTTP_PROXY" ]; then
		configString="$configString --apt-http-proxy $APT_HTTP_PROXY"
	fi
	if [ -n "$APT_FTP_PROXY" ]; then
		configString="$configString --apt-ftp-proxy $APT_FTP_PROXY"
	fi

	configString="$configString --mirror-bootstrap http://archive.ubuntu.com/ubuntu/"
	configString="$configString --mirror-binary http://archive.ubuntu.com/ubuntu/"
	configString="$configString --mirror-chroot http://archive.ubuntu.com/ubuntu/"

	lh config --mode ubuntu --archive-areas "$CATEGORIES" $configString

	# Copy files for chroot
	cp -R "$THISDIR"/Files/chroot_* config
}

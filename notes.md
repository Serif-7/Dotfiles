
* hosts/: host-specific configuration files
* global_config: global system configuration for all hosts
* configs/: program-specific configuration files
* scripts/: miscellaneous code, currently contains debugger scripts
* home.nix: home-manager config and package list
* flake.nix: Description of overall config
* flake.lock: list of dependencies and versions of current packages
		updated by `nix flake update`
* `build.sh` runs the rebuild command and imperatively copies configs not handled
	by home manager to their proper location

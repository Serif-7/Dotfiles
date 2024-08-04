
* hosts/: host-specific configuration files
* global_config: global system configuration for all hosts
* configs/: program-specific configuration files
* scripts/: miscellaneous code, currently contains debugger scripts
* shells/: devshells / environments
* home.nix: home-manager profile and package list
* hm.nix: global home-manager config
* flake.nix: Description of overall config
* flake.lock: list of dependencies and versions of current packages
		updated by `nix flake update`


# Adding New Host instructions

* Always make user `daniel`
* add host specific config to `flake.nix` and `hosts/`
* add ssh keys
* add host to known hosts

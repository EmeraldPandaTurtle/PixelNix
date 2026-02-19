.PHONY: rebuild-os rebuild-home jj delete-generations

rebuild-os: jj
	nu scripts/rebuild-nix.nu

rebuild-home: jj
	nu scripts/rebuild-home-manager.nu

jj:
	jj diff || true

delete-generations:
	sudo nix-collect-garbage -d

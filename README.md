# My Nixos Flake

This flake contains my hosts, configs and modules.

## structure

```
Dennkaii/
├───hosts/          (machine specific configuration)
│   └───Aethyr/           [Main machine]
│
├───configs/          (User specific configuration)
│   └───dennkaii/           [Unique User]
│
├───modules/        (custom modules you can enable under `config`)
│   ├───display/         (Window managers configurations + fcitx)
│   ├───programs/        (Modules for programs i use, wanted to or just tried one time, also games)
│   ├───misc/        (Configuration of things that should alway be working no 'mkIf' modules)
│   └───services/         (where i have docker, podman, tailscale. May merge with programs)
│
├───Wallpapes/        (Literally my wallpaper collection so far)
│
└───secrets/        (agenix secrets)
```

## TODO
- [ ] Set Up Agenix
- [ ] Find a new Wallpaper
- [ ] Cloud server
- [ ] organize modules properly

And more to come soon.

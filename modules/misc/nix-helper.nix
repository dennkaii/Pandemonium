{
  inputs,
  config,
  ...
}: {
  config = {
    # inputs.nh.url = "github:viperML/nh";

    osModules = [
      # inputs.nh.nixosModules.default
    ];

    # os.environment.variables.FLAKE = "/home/${config.users.main}/NixArchy";
    os.environment.variables.FLAKE = "${toString config.defaults.flake_dir}";
    os.programs.nh = {
      enable = true;
    };
  };
}

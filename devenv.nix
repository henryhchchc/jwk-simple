{ pkgs, inputs, ... }:

{
  cachix.pull = [ "sagikazarmark-dev" ];

  # dotenv.enable = true;

  dagger.enable = true;
  env.DAGGER_X_RELEASE = "v1.0.0-beta.10";

  env.CC_wasm32_unknown_unknown = "${pkgs.llvmPackages.clang-unwrapped}/bin/clang";

  # overlays = [
  #   (
  #     final: prev:
  #     let
  #       unstable = inputs.nixpkgsUnstable.legacyPackages.${prev.stdenv.hostPlatform.system};
  #     in
  #     {
  #       inherit (unstable)
  #         chromedriver
  #         geckodriver
  #         wasm-pack
  #         wasm-bindgen-cli_0_2_108
  #         ;
  #     }
  #   )
  # ];

  packages = with pkgs; [
    cargo-audit
    cargo-release
    cargo-watch
    cargo-expand
    wasm-pack
    # wasm-bindgen-cli_0_2_108
    wasm-bindgen-cli_0_2_126
    # chromedriver
    geckodriver
  ];

  languages.rust = {
    enable = true;
    channel = "stable";
    targets = [ "wasm32-unknown-unknown" ];
  };
}

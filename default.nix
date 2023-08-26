{}:

let
    # Common patterns
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/haskell-modules/lib.nix

    # Sometimes nix packages are thought to be broken, and have their `meta.broken` set to `true`.
    # This does not necessarily mean that they indeed are broken - the flags may be artifacts of
    # previous nixpkgs revisions that had known issues, and people disabled certain packages to
    # make Nix Hydra (Nix CI infrastructure) green. As the flags are not automatic,
    # people need to set/unset them explicitly through pull requests, or inside their own derivations.
    commonEnv       = import ./nixpkgs {};
    pkgs            = commonEnv.pkgs;
    macOsDevTools   = with pkgs; lib.optional stdenv.isDarwin [
        darwin.moltenvk.dev
        SDL2.dev
        SDL2_ttf
        SDL2_net.dev
        SDL2_gfx
        SDL2_sound
        SDL2_mixer.dev
        SDL2_image
        glfw
    ];
    devEnv = pkgs.mkShell {
        # Sets the build inputs, i.e. what will be available in our
        # local environment.
        nativeBuildInputs = with pkgs; [
            git
            gnumake
            cmakeMinimal
            which
        ];
        buildInputs = with pkgs; [
            # local dev infra tooling
            # -------------------------------
            pkg-config
            curlMinimal.dev
            zlib.dev
        ] ++ macOsDevTools;
        #env.NIX_CFLAGS_COMPILE = "-I${pkgs.SDL2.dev}/include/SDL2";
        shellHook = ''
            export CURRENT_SYSTEM="${builtins.currentSystem}"
            export LC_ALL=en_GB.UTF-8
            export LANG=en_GB.UTF-8
        '';
    };

in

{
    inherit devEnv;
}

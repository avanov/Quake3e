{ customOverlays ? []}:

let

common-src = (builtins.fetchGit {
    url = "https://github.com/avanov/nix-common.git";
    ref = "master";
    rev = "f380d2522f20f2fcb50d54c8d0a0dddc441bacde";
});

in

import common-src { projectOverlays = customOverlays; }
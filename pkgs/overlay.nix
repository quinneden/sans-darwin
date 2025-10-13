{ inputs }:

{
  default = final: prev: { marble-shell = final.callPackage ./marble-shell { inherit inputs; }; };
}

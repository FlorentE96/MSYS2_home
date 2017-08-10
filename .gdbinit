set history save
define connect
  target remote :3333
end
define Q2F
  printf "$arg0 : %ld -> %.15f\n\r", $arg0, (float)$arg0/(1U<<$arg1)
end
define Q2F_dbl
  printf "$arg0 : %ld -> %.15f\n\r", $arg0, (double)$arg0/(1U<<$arg1)
end
add-auto-load-safe-path C:\Users\Florent\Documents\Work\KORG\openvolca-firmware\firmware\src\.gdbinit

set print pretty on

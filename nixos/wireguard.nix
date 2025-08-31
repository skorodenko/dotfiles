{ ... }:
{
  # wireguard config
  networking.wg-quick.interfaces = {
    wg0 = {
      autostart = false;
      address = [
        "10.8.0.3/32"
      ];
      dns = [
        "10.8.1.3"
        "192.168.0.220"
      ];

      mtu = 1330;
      privateKeyFile = "/keys/wg0.key";

      peers = [
        {
          publicKey = "M07KS33UMhJ9kq6eiE2gU9a+3NOHntcr5YvWGtD2Yxg=";
          presharedKeyFile = "/keys/wg0.preshared";
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          endpoint = "100.65.58.108:51820";
          persistentKeepalive = 21;
        }
      ];
    };
  };
}

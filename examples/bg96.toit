// Copyright (C) 2022 Toitware ApS.
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the EXAMPLES_LICENSE file.

/**
This example demonstrates how to connect to a network service through the
  cellular network provided by a BG96 modem.

The example resets the modem before connecting to remove any unexpected state
  before connecting. However, this makes the connection time fairly long.
*/

import http
import log
import net.cellular

main:
  config ::= {
    cellular.CONFIG_APN: "onomondo",
    cellular.CONFIG_BANDS: [20, 8],

    cellular.CONFIG_UART_TX: 26,
    cellular.CONFIG_UART_RX: 25,

    cellular.CONFIG_POWER: [27, cellular.CONFIG_OPEN_DRAIN],

    cellular.CONFIG_LOG_LEVEL: log.INFO_LEVEL,
  }

  print "Opening cellular network"
  network := cellular.open config

  try:
    client := http.Client network
    host := "www.google.com"
    response := client.get host "/"

    bytes := 0
    while data := response.body.read:
      bytes += data.size

    print "Read $bytes bytes from http://$host/ via cellular"

  finally:
    network.close

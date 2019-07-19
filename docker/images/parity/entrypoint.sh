#!/usr/bin/env sh

set -o xtrace

PARITY="/home/parity/parity"
PARITY_CHAIN=${PARITY_CHAIN:-"mainnet"}

case "$PARITY_CHAIN" in
  mainnet)
    $PARITY --tracing on --pruning archive --ws-interface 0.0.0.0 --ws-origins='*' --ws-hosts='*' --jsonrpc-interface 0.0.0.0 --min-peers $PARITY_MIN_PEERS --max-peers $PARITY_MAX_PEERS
  ;;
  ropsten)
    $PARITY --chain $PARITY_CHAIN --tracing on --pruning archive --ws-interface 0.0.0.0 --ws-origins='*' --ws-hosts='*' --jsonrpc-interface 0.0.0.0 --min-peers $PARITY_MIN_PEERS --max-peers $PARITY_MAX_PEERS --bootnodes "enode://7778cd2215a3ff83c2191ca2cc303d9be1833e00ff5b945d94b4f256e0435ccda1f6abcb404bdd9862c5c255678a549b427b445991bc4f24fabb8229cbd33673@3.91.179.124:30303,enode://e5bb001edeb2342770bc03d00d89d04ba4536eb6ed82226eeb2206d8a3d511dd1c9cff0c9a09fc6cc0674424ec79a562d409258e9d04e2dc415bc0741bcaa44a@40.115.33.57:30305,enode://1447e19cb570a4d4dcaee418d410a5a242a26e9697a8d40180916576c0b0120b59af1759e4234e1e1f110accfe53566523d8073af30af93bbd3ddc20062a3851@104.248.159.93:30303,enode://15ac307a470b411745a6f10544ed54c0a14ad640b21f04f523e736e732bf709d4e28c2f06526ecabc03eed226b6d9bee8e433883cd20ab6cbd114bab77a8775d@52.176.7.10:30303,enode://e05b76d5f90860f13e066f7d5ae313290276181c48af4d753117ea1fe909a33b295ab37ada51fc0c0a9c8ffe618a0968c4e26f21cdc8a21f184ed7960c347ace@35.224.90.32:30303,enode://f0fa95ee17a42b4cf5fee104c5ad61115ff63b2f720c027b1246188afc93a61ba1d67121ea9ebfa78678e796a562a5d949ed5265549f0a4936b7f3bd8d5d2706@35.170.55.156:30303,enode://6ab5116c43c713096b3b3667ea9a24105bcb860bc81ec36f6b271694b9174bb1721232d56cfd2d9a5aa17fbac552833dec24282cfeb43af6572ae6f9bc157bf4@139.99.122.139:30302,enode://378b35851a8e55ddc607c8dd0b3f809787dd23200fa12fe112966de8ef77bb132b42d7adfa313c293a06ce7e3473495216fcd18cda6ff4814655ae734069be94@51.255.77.89:30302,enode://f0fa95ee17a42b4cf5fee104c5ad61115ff63b2f720c027b1246188afc93a61ba1d67121ea9ebfa78678e796a562a5d949ed5265549f0a4936b7f3bd8d5d2706@35.170.55.156:30303,enode://6ab5116c43c713096b3b3667ea9a24105bcb860bc81ec36f6b271694b9174bb1721232d56cfd2d9a5aa17fbac552833dec24282cfeb43af6572ae6f9bc157bf4@139.99.122.139:30302,enode://378b35851a8e55ddc607c8dd0b3f809787dd23200fa12fe112966de8ef77bb132b42d7adfa313c293a06ce7e3473495216fcd18cda6ff4814655ae734069be94@51.255.77.89:30302"
  ;;
  private)
    $PARITY --config dev-insecure --reseal-min-period 10000 -lminer=trace --ws-apis all --tracing on --pruning archive --ws-interface 0.0.0.0 --ws-origins='*' --ws-hosts='*' --jsonrpc-interface 0.0.0.0 --min-peers $PARITY_MIN_PEERS --max-peers $PARITY_MAX_PEERS
  ;;
  *)
    echo "Invalid PARITY_CHAIN = $PARITY_CHAIN selected!"
    exit 1
  ;;
esac

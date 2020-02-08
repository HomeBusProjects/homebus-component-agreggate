[Unit]
Description=Homebus Aggregate Component
After=network.target

[Service]
Type=simple

User=homebus
WorkingDirectory=/home/homebus/homebus-component-aggregate

ExecStart=/home/homebus/.rbenv/bin/rbenv exec bundle exec homebus-component-aggregate.rb
TimeoutSec=30

Restart=always

[Install]
WantedBy=multi-user.target


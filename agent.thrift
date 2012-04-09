namespace * HSAgent

exception Error {
  1: string message
}

exception AuthenticationError {
  1: string message
}

exception NoDeploymentFoundError {
  1: string message
}

struct SSHCredentials {
  1: string app_id,
  2: string agent_ip,
  3: string sshkey,
}

service Control {
  void heartbeat(1: string deployment_install_token) throws (1: Error e, 2: NoDeploymentFoundError ndf),
  void snapshot_vm(1: string deployment_install_token, 2: string log_name, 3: bool first_start) throws (1: Error e, 2: NoDeploymentFoundError ndf),
  void stop_vm(1: string deployment_install_token) throws (1: Error e, 2: NoDeploymentFoundError ndf),
  string start_vm_protocol(1: string deployment_install_token, 2: string protocol) throws (1: Error e, 2: NoDeploymentFoundError ndf),
  SSHCredentials fetch_ssh_credentials(1: string username, 2: string password) throws (1: Error e, 2: AuthenticationError ae, 3: NoDeploymentFoundError ndf),
  void execute_app_command(1: string deployment_install_token, 2: string log_name, 3: string command_name, 4: string command) throws (1: Error e, 2: NoDeploymentFoundError ndf),
  void gateway_routes_changed() throws (1: Error e),
}

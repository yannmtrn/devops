# Projet transverse DevOps

| Nom du serveur | Adresse IP | OS | WEB | BDD | Supervision | Proxy | Hyperviseur | Commentaire |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| ST2CN205-10.numerilab-cesi.fr | 172.16.47.65 | Windows Server 2022 |  |  |  |  | X | Hyperviseur hébergeant les VMs |
| CHKMK | 172.16.47.134 | Debian 11 |  |  | X |  |  | Serveur de supervision |
| reverse-proxy | 172.16.47.122 | Debian 11 |  |  |  | X |  | Serveur proxy d’accès au serveurs Web (.31 et .117) |
| srv-bdd | 172.16.47.140 | Debian 11 |  | X |  |  |  | Serveur de BDD principal |
| SRV-BDD2 | 172.16.47.149 | Debian 11 |  | X |  |  |  | Serveur de BDD secondaire |
| SRV-TEST | 172.16.47.50 | Debian 11 | X | X |  |  |  | Serveur bac à sable |
| SRV-WEB2-G10 | 172.16.47.117 | Debian 11 | X |  |  |  |  | Serveur Web secondaire + 3ème serveur BDD |
| SRV-WEB-G10 | 172.16.47.31 | Debian 11 | X | X |  |  |  | Serveur Web principal  |
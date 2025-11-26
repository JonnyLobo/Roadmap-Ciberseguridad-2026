Laboratorio — Configuración del Entorno SOC
Esta carpeta contiene toda la documentación relacionada con la configuración técnica del laboratorio.

🧱 Componentes del laboratorio
Kali Linux (ATACANTE / ANALISTA)
Windows 11 VM (VICTIMA)
Windows Host (MÁQUINA FÍSICA)
VMware Workstation (BRIDGED)

🏗️ Configuración de red (Bridged)
La red está configurada para replicar un entorno real:
Router:        192.168.1.1
Host Físico:   192.168.1.101
Windows VM:    192.168.1.103
Kali VM:       192.168.1.107

Todas las máquinas están en la misma subred /24.
🧩 Problemas solucionados
NAT habilitado accidentalmente
VM aislada en red privada
VMnet0 usando adaptador equivocado
Corrección seleccionando Realtek PCIe GbE Controller
Firewall de Windows bloqueando ping (requiere -Pn)

📂 Archivos incluidos
vmware_bridged_setup.md
vm_network_diagram.png

notes.md

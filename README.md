# OpenIndiana Packer template

Creates a vagrant box for OpenIndiana.

Run using `packer build template.json`

Notes:

 * A single ZFS pool (rpool) is created for the entire disk
 * The VM is set to have 1024MB of RAM and a 40GB drive

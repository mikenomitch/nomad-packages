# Elastic Block Storage CSI Setup

## Steps

- ensure you have the proper permissions in AWS to manage volumes (see below)

- bindle install

- ensure the CSI controller and nodes are healthy

- use the volume.hcl file in a nomad volume create command (match the pluginId)

- deploy a job that uses the new volume

## Necessary permissions

ec2:AttachVolume
ec2:CreateSnapshot
ec2:CreateTags
ec2:CreateVolume
ec2:DeleteSnapshot
ec2:DeleteTags
ec2:DeleteVolume
ec2:DescribeAvailabilityZones
ec2:DescribeInstances
ec2:DescribeSnapshots
ec2:DescribeTags
ec2:DescribeVolumes
ec2:DescribeVolumesModifications
ec2:DetachVolume
ec2:ModifyVolume

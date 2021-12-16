# If looking up a cluster profile instead of creating a new one
# data "spectrocloud_cluster_profile" "profile" {
#   # id = <uid>
#   name = var.cluster_profile_name
# }

# # Example of a Basic add-on profile
# resource "spectrocloud_cluster_profile" "cp-addon-aws" {
#   name        = var.cluster_profile_name
#   description = var.cluster_profile_description
#   cloud       = var.cloud
#   type        = var.type
#   pack {
#     name = "spectro-byo-manifest"
#     tag  = "1.0.x"
#     uid  = "5faad584f244cfe0b98cf489"
#     # layer  = ""
#     values = <<-EOT
#       manifests:
#         byo-manifest:
#           contents: |
#             # Add manifests here
#             apiVersion: v1
#             kind: Namespace
#             metadata:
#               labels:
#                 app: wordpress
#                 app3: wordpress3
#               name: wordpress
#     EOT
#   }
# }


data "spectrocloud_pack" "byom" {
  name = "spectro-byo-manifest"
  # version  = "1.0.x"
}

data "spectrocloud_pack" "csi" {
  name = "csi-aws"
  # version  = "1.0.x"
}

data "spectrocloud_pack" "cni" {
  name    = "cni-calico"
  version = "3.16.0"
}

data "spectrocloud_pack" "k8s" {
  name    = "kubernetes"
  version = "1.20.1"
}

data "spectrocloud_pack" "ubuntu" {
  name = "ubuntu-aws"
  # version  = "1.0.x"
}

resource "spectrocloud_cluster_profile" "profile" {
  name        = var.cluster_profile_name
  description = var.cluster_profile_description
  tags        = var.cluster_profile_tags
  cloud       = var.cloud
  type        = var.type


pack {
    name   = "ubuntu-aws"
    tag    = "LTS__18.4.x"
    uid    = data.spectrocloud_pack.ubuntu.id
    values = data.spectrocloud_pack.ubuntu.values
  }
pack {
    name   = "kubernetes"
    tag    = "1.20.1"
    uid    = data.spectrocloud_pack.k8s.id
    values = data.spectrocloud_pack.k8s.values
  }
pack {
    name   = "cni-calico"
    tag    = "3.16.x"
    uid    = data.spectrocloud_pack.cni.id
    values = data.spectrocloud_pack.cni.values
  }
  pack {
    name   = "csi-aws"
    tag    = "1.0.x"
    uid    = data.spectrocloud_pack.csi.id
    values = data.spectrocloud_pack.csi.values
  }
  pack {
    name   = "spectro-byo-manifest"
    tag    = "1.0.x"
    uid    = data.spectrocloud_pack.byom.id
    values = <<-EOT
      manifests:
        byo-manifest:
          contents: |
            # Add manifests here
            apiVersion: v1
            kind: Namespace
            metadata:
              labels:
                app: wordpress
                app3: wordpress3
              name: wordpress
    EOT
  }
}

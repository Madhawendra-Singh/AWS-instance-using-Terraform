variable ports{
    type = list(number)//instance.tf line 7
}

variable image_id{
    type = string//instance.tf line 41 ami
}

variable instance_type{
    type = string//instance.tf line 42 instance_type
}

# variable access_key{
#     type = string
# }

# variable secret_key{
#     type = string
# }
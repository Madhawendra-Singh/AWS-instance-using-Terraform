//
// the below block is for ssh key value pair creation(vid 33)
//

resource "aws_key_pair" "key-tf" {
  key_name   = "made-with-terrafom-code"
  public_key = file("${path.module}/id_rsa.pub")// (video33)here we are applying the concept of copying and reading froma file 
}
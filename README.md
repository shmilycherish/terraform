create a tf file, could be any name, here we use main.tf


terraform init 初始化terraform目录，这里类似git init

terraform plan 预览执行计划

terraform apply 执行计划

terraform destory 销毁机器

terraform fmt 格式化tf文件

#What we will do in this workshop
1.Hexo生成静态网站

2.创建ec2，security group，route53

3.在ec2部署nginx，上传静态网站到ec2，并启动nginx,配置route53域名访问
 (Domain name: workshop.oc-tw.net.）
 
 使用terrform完成上述自动化脚本，最后可以访问{name}.workshop.oc-tw.net
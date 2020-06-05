### 配置服务器ssh密钥，免git登陆
  - 1.配置服务器ssh密钥  
      登陆服务器执行以下命令
      ```
      [In:] ssh-keygen
      #回车就行了
      [In:] eval $(ssh-agent -s)
      [In:] ssh-add ~/.ssh/id_rsa
      [In:] touch ~/.ssh/authorized_keys
      ```  
  - 2.配置本地ssh密钥  
      本地linux执行以下操作，***切换到与服务器同名的用户***  
      ```
      [In:] ssh-keygen
      #回车就行了
      [In:] eval $(ssh-agent -s)
      [In:] ssh-add ~/.ssh/id_rsa
      ```  
  - 3.添加本地公钥到服务器  
      ```
      #本地linux命令
      [In:] cat ~/.ssh/id_rsa.pub  #可以看到打印很长一串的字符，复制这一串字符
      #服务器命令
      [In:] echo "复制的那串公钥字符串" >> ~/.ssh/authorized_keys
      ```  
      之后不管是git clone、push、pull都不用输入密码了，特别是有submodule的时候就很方便

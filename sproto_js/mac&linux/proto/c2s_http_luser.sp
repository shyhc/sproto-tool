.package {
    type 0 : integer
    session 1 : integer
}

# 登录
luser_login 1001 {
    request {
        uid 0:integer
        password 1:string
    }
    response {
        code 0:integer
        token 1:string
        server_ip 2:string
        server_port 3:integer
        systime 4:integer
    }
}

# 注册
luser_register 1002 {
    request {
    }
    response {
        code 0:integer
        token 1:string
        server_ip 2:string
        server_port 3:integer
        uid 4:integer
        password 5:integer
        systime 6:integer
    }
}
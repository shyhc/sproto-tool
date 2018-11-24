
test_user_info 10001 {
    request {
        uid 0: integer
    }
    response {
        code 0: integer
        uid 1:integer
        nickname 2:string
        sex 3:integer
        password 4:string
    } 
}

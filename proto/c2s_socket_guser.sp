keepalive 101 {
    request {
    }
    response {
        systime 0: integer
    }
}

guser_auth_token 1001 {
    request {
        uid 0: integer
        token 1: string
    }
    response {
        code 0: integer
    }    
}

guser_replace 1002 {
    request {
        uid 0:integer
    }
    response {
        code 0:integer
    }
}
User.create(name: "Gregory Peres",
                  email: "gregperes84@gmail",
                  login: "gregperes",
                  password: "123456",
                  password_confirmation: "123456") unless User.find_by_login("gregperes").present?

User.create(name: "Marcos Zimermann",
                  email: "marcoslz@hotmail.com.br",
                  login: "marcosz",
                  password: "123456",
                  password_confirmation: "123456") unless User.find_by_login("marcosz").present?

User.create(name: "Wagner Parmezao",
                  email: "wagner@parmex.com.br",
                  login: "wagner",
                  password: "123456",
                  password_confirmation: "123456") unless User.find_by_login("wagner").present?


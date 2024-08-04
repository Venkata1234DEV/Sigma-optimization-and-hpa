# Create redis-service container with the label com.a2odev.app=sigma
docker run -d --name redis-service --label com.a2odev.app=sigma redis

# Create api-gw container with the label com.a2odev.app=sigma
docker run -d --name api-gw --label com.a2odev.app=sigma nginx

# Create proxy-server container with the label com.a3odev.api=sigma
docker run -d --name proxy-server --label com.a3odev.api=sigma nginx

# Create another proxy-server container with the label com.a2odev.app=sigmano
docker run -d --name proxy-server2 --label com.a2odev.app=sigmano nginx

# Create mongodb-service container with the label com.a2odev.app=sigma
docker run -d --name mongodb-service --label com.a2odev.app=sigma mongo

# Create nginx-service container with the label com.com.a2odev.appp=sigma
docker run -d --name nginx-service --label com.com.a2odev.appp=sigma nginx

# Create mysql-db-service container with the label com.a2odev.api.app=sigma
docker run -d --name mysql-db-service --label com.a2odev.api.app=sigma mysql


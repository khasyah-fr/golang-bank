postgres:
	docker exec -it postgres-15 -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine

createdb:
	docker exec -it postgres-15 createdb --username=root --owner=root golang_bank

dropdb:
	docker exec -it postgres-15 dropdb golang_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/golang_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/golang_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc
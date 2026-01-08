install:
	go install github.com/hexe-dev/hexe

regenrate: install
	hexe gen http ./e2e/http/http.gen.go ./e2e/http/http.hexe
	hexe gen stream ./e2e/stream/stream.gen.go ./e2e/stream/stream.hexe
	hexe gen upload ./e2e/upload/upload.gen.go ./e2e/upload/upload.hexe
	hexe gen rpc ./e2e/rpc/rpc.gen.go ./e2e/rpc/rpc.hexe
	hexe gen http ./e2e/http_async_stream/http_async_stream.gen.go ./e2e/http_async_stream/http_async_stream.hexe
	hexe gen download ./e2e/download/download.gen.go ./e2e/download/download.hexe

run-e2e: regenrate
	go mod tidy
	go test ./e2e/http/... -v
	go test ./e2e/stream/... -v
	go test ./e2e/upload/... -v
	go test ./e2e/rpc/... -v
	go test ./e2e/http_async_stream/... -v
	go test ./e2e/download/... -v
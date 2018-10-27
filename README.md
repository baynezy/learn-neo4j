# Learn Neo4j

This is a learning project for working with Neo4j.

## Build Docker Image

```powershell
docker build -t apoc-neo4j .
```

## Start via Docker

``` powershell
$path = $(Get-Location).Path
$nonwindowspath = ($path -replace "\\","/")
$data = "$($nonwindowspath)/data"
$logs = "$($nonwindowspath)/logs"

docker run --rm -p 7474:7474 -p 7687:7687 --volume="$($data):/data" --volume="$($logs):/logs" apoc-neo4j
```
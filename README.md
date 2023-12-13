# TraceFlow

### Current Todo

* Fix Access-Control-Allow-Origin

## Setting up

There are several default values set in the `.env`-file and can be changed if wished. This includes:
- `POSTGRES_HOST`
- `POSTGRES_DB`
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `API_TAG` referencing the version of the API-image to be retrieved from quay.io
- `UI_TAG` referencing the version of the UI-image to be retrieved from quay.io

Run `docker-compose up -d`, as the images needed are defined in the compose-file.
Default ports of the stack are:
 - 5432 for database
 - 8001 for UI
 - 8000 for API

## Get Started

*Needs adjustments*

Start the stack as described. 


### Token Creation
Go to `localhost:8001" and click on "Go to token management".
Create a new token and then click "manage" to get to the view instruction the use of the token

### Using the token for traces

The `with-weblog http://localhost:8000/run/<token-id>/` flag needs to be set when executing the nextflow-workflow.
The metrics and the progress then get automatically updated on the corresponding UI-page (http://localhost:8001/run/<token-id>/).

## Connected repositores

The application is based on an [API-component](https://github.com/vktrrdk/nextflowAnalysisAPI) and a [frontend-component](https://github.com/vktrrdk/nextflowAnalysisUI).

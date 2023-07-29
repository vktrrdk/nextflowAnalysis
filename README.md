# TraceFlow

**Note**: Some values are still hardcoded in the code of the repositories, so changing values in the `.env`-file might not have any effects yet.

## Setting up

Just run `docker-compose -d`, as the images needed are defined in the compose-file.
Current ports of the stack are:
 - 5432 for database
 - 8001 for UI
 - 8000 for API

## Get Started

Start the stack as described. 

### Token Creation
Go to `localhost:8001" and click on "Go to token management".
Create a new token and then click "manage" to get to the view instruction the use of the token

### Using the token for traces

The `with-weblog http://localhost:8000/run/<token-id>/` flag needs to be set when executing the nextflow-workflow.
The metrics and the progress then get automatically updated on the corresponding UI-page (http://localhost:8001/run/<token-id>/).

## Connected repositores

The application is based on an [API-component](https://github.com/vktrrdk/nextflowAnalysisAPI) and a [frontend-component](https://github.com/vktrrdk/nextflowAnalysisUI).
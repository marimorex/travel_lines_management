# TravelLinesManagement

## Analysis and Design 

[Entity Relationship Model](https://drive.google.com/file/d/1eZlxVNXEqfFLHQ7Sbx5sBmmJVlEOUjFk/view?usp=sharing)

## Start Phoenix Server

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup` 
    * `ecto.setup `: ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"]]
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Insights 

* All necessary data is inserted into the database with the command `mix ecto.setup`
* All endpoints are available in the file `Travel_Lines_Management.postman_collection.json` 

### Some usefull endpoints 

#### http://localhost:4000/api/travels/:travel_id/travel_details (POST)

Creates a new detail for the travel, counting the passengers entering the vehicle, exiting the vehicle and the total number of passengers on the vehicle. 

**REQUEST**
Headers: `Content-Type: application/json`
``` json
{
    "travel_detail": 
    {
        "stop_id": 3,
        "passangers_get_on_stop" : 3,
        "passangers_get_down_stop" : 7,
        "status": 1
    }
 }

```

**RESPONSE**
```json
{
    "travel_details": {
        "arrival": null,
        "departure": null,
        "passangers_get_down_stop": 7,
        "passangers_get_on_stop": 3,
        "passangers_on_board": 11,
        "status": 1,
        "stop": null,
        "travel_id": 1
    }
}
```

---


### http://localhost:4000/api/travels/:travel_id/travel_details (GET)

Get all travel details. 


**REQUEST**
Headers: `x-access-token`

**RESPONSE**
```json
{
    "travel_details": [
        {
            "arrival": null,
            "departure": null,
            "passangers_get_down_stop": 0,
            "passangers_get_on_stop": 10,
            "passangers_on_board": 10,
            "status": 1,
            "stop": {
                "city_name": "Niort",
                "gps_latitude": null,
                "gps_longitude": null,
                "id": 1,
                "name": "Gare SNCF",
                "order": 1,
                "status": 1,
                "time": "05:50:00"
            },
            "travel_id": 1
        },
        {
            "arrival": null,
            "departure": null,
            "passangers_get_down_stop": 0,
            "passangers_get_on_stop": 5,
            "passangers_on_board": 15,
            "status": 1,
            "stop": {
                "city_name": "Niort",
                "gps_latitude": null,
                "gps_longitude": null,
                "id": 2,
                "name": "Pl. de la Brèche",
                "order": 2,
                "status": 1,
                "time": "05:55:00"
            },
            "travel_id": 1
        },
        {
            "arrival": null,
            "departure": null,
            "passangers_get_down_stop": 7,
            "passangers_get_on_stop": 3,
            "passangers_on_board": 11,
            "status": 1,
            "stop": {
                "city_name": "St-Christophe-sur-Roc",
                "gps_latitude": null,
                "gps_longitude": null,
                "id": 3,
                "name": "Montplaisir",
                "order": 3,
                "status": 1,
                "time": "06:13:00"
            },
            "travel_id": 1
        }
    ]
}
```

---


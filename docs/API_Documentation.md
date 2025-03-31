# API documentation for SHA chatbot
This document provides a comprehensive overview of the API endpoints available for interacting with the SHA Chatbot backend.

## Base URL

The base URL for the API is: `http://127.0.0.1:8000` (This may vary depending on your deployment environment).

## Endpoints

### 1. Chatbot Query (`/chat/`)

* **Endpoint:** `/chat/`
* **HTTP Method:** `POST`
* **Description:** This endpoint allows users to send a query to the SHA Chatbot and receive a response. It utilizes a hybrid AI model combining retrieval-based and potentially generative techniques to answer user questions.

* **Request Body (JSON):**

    ```json
    {
      "user_input": "Your question or query here"
    }
    ```

    * `user_input` (string, required): The text query from the user.

* **Response (JSON - 200 OK):**

    ```json
    {
      "response": "The chatbot's answer to your query."
    }
    ```

    * `response` (string): The chatbot's generated or retrieved response to the user's input.

* **Error Responses:**
    * **400 Bad Request:** Returned if the `user_input` is empty or invalid.
        ```json
        {
          "detail": "User input cannot be empty"
        }
        ```
    * **422 Unprocessable Content:** Returned if the request body is not valid JSON or if required fields are missing.
        ```json
        {
          "detail": [
            {
              "loc": [
                "body",
                "user_input"
              ],
              "msg": "Field required",
              "type": "missing"
            }
          ]
        }
        ```
    * **500 Internal Server Error:** Returned if there is an unexpected error on the server while processing the query or generating a response. The `detail` field may provide more information.

* **Example Usage (using `curl`):**

    ```bash
    curl -X POST \
      '[http://127.0.0.1:8000/chat/](http://127.0.0.1:8000/chat/)' \
      -H 'Content-Type: application/json' \
      -d '{
        "user_input": "What are the benefits of SHA in Kenya?"
      }'
    ```

### 2. Analytics Endpoints (`/analytics/`)

* **Base Prefix:** `/analytics/`
* **Description:** These endpoints provide insights into the usage of the chatbot.

    * **2.1 Total Queries (`/analytics/total_queries/`)**
        * **Endpoint:** `/analytics/total_queries/`
        * **HTTP Method:** `GET`
        * **Description:** Returns the total number of queries received by the chatbot.
        * **Response (JSON - 200 OK):**
            ```json
            {
              "total_queries": 1234
            }
            ```

    * **2.2 Common Questions (`/analytics/common_questions/`)**
        * **Endpoint:** `/analytics/common_questions/`
        * **HTTP Method:** `GET`
        * **Description:** Returns a list of the most common questions asked to the chatbot.
        * **Query Parameters:**
            * `limit` (integer, optional): The maximum number of common questions to return (default: all).
        * **Response (JSON - 200 OK):**
            ```json
            [
              {"question": "What is SHA?", "count": 150},
              {"question": "How do I register?", "count": 120},
              {"question": "What are the benefits?", "count": 95}
            ]
            ```

    * **2.3 User Engagement Over Time (`/analytics/user_engagement/`)**
        * **Endpoint:** `/analytics/user_engagement/`
        * **HTTP Method:** `GET`
        * **Description:** Returns the number of queries per day (or a specified time period).
        * **Query Parameters:**
            * `days` (integer, optional): The number of past days to retrieve engagement data for (default: 7).
        * **Response (JSON - 200 OK):**
            ```json
            [
              {"date": "2025-03-25", "query_count": 50},
              {"date": "2025-03-26", "query_count": 65},
              {"date": "2025-03-27", "query_count": 72}
            ]
            ```

    * **2.4 Average Response Time (`/analytics/response_time/`)**
        * **Endpoint:** `/analytics/response_time/`
        * **HTTP Method:** `GET`
        * **Description:** Returns the average time taken to respond to user queries (currently based on query timestamps).
        * **Response (JSON - 200 OK):**
            ```json
            {
              "average_response_time": 1.23  // Average time in seconds (currently based on query timestamps)
            }
            ```

## Authentication (Currently None)

The API currently does not implement any authentication mechanisms. All endpoints are publicly accessible.

## Rate Limiting (Currently None)

The API does not currently implement any rate limiting.

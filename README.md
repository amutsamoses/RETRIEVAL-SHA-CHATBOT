# RETRIEVAL-SHA-CHATBOT: A Hybrid Chatbot for Specific Health Area (SHA) in Kenya

## Overview

The RETRIEVAL-SHA-CHATBOT is a backend application built using FastAPI (Python) designed to provide information and answer user queries related to a Specific Health Area (SHA) within the context of Kenya. It employs a hybrid AI model that leverages both retrieval-based techniques and potentially generative capabilities to understand user input and provide relevant responses.

This project aims to:

- Offer users quick and accurate information about SHA in Kenya.
- Provide a platform for accessing relevant health-related knowledge.
- Potentially integrate with other systems or user interfaces to enhance accessibility.

## Project Structure

The repository is organized as follows:

```
RETRIEVAL-SHA-CHATBOT
├─ backend
│  ├─ .env
│  ├─ ai
│  │  ├─ nltk_bot.py
│  │  ├─ preprocess.py
│  │  ├─ response.py
│  │  ├─ retrieval.py
│  │  ├─ tfidf_model.py
│  │  ├─ train_model.py
│  │  └─ word2vec_model.py
│  ├─ app
│  │  ├─ config.py
│  │  ├─ db.py
│  │  ├─ main.py
│  │  ├─ models.py
│  │  ├─ routes
│  │  │  ├─ analytic.py
│  │  │  ├─ chat.py
│  │  │  ├─ sha.py
│  │  │  └─ user.py
│  │  └─ utils.py
│  ├─ Dockerfile
│  ├─ README.md
│  └─ requirements.txt
├─ datasets
│  ├─ cleaned_data.txt
│  ├─ data.txt
│  ├─ intents.json
│  └─ queries.csv
├─ deployment
│  ├─ Dockerfile
│  ├─ render.yaml
│  └─ vercel.json
├─ docs
│  ├─ API_Documentation.md
│  ├─ Dataset_Description.md
│  └─ Model_Training.md
├─ frontend
├─ models
│  ├─ sentence_tokens.pkl
│  ├─ tfidf_vectorizer.pkl
│  ├─ word2vec_model.bin
│  └─ word_tokens.pkl
├─ README.md
└
```

## Backend (FastAPI)

The backend of the RETRIEVAL-SHA-CHATBOT is built using the FastAPI framework. It provides the API endpoints for users to interact with the chatbot and for retrieving analytics data.

- **API Endpoints:**
  - `/chat/` (POST): Accepts user queries and returns chatbot responses.
  - `/analytics/total_queries/` (GET): Returns the total number of queries.
  - `/analytics/common_questions/` (GET): Returns a list of common questions.
  - `/analytics/user_engagement/` (GET): Returns user engagement data over time.
  - `/analytics/response_time/` (GET): Returns the average response time.
  - (Potentially) `/auth/` (various methods): Endpoints for user authentication and management.
- **Hybrid AI Model:** The core logic resides in `backend/ai/hybrid_model.py`. It likely implements a combination of techniques:
  - **Retrieval:** Using models like TF-IDF (trained on the data in `datasets/data.txt`) to find the most relevant information based on user queries.
  - **Generative (Potentially):** Integrating with pre-trained language models (e.g., via libraries like Transformers) to generate more dynamic responses when a direct retrieval match is insufficient.
- **Data Handling:** The application loads and preprocesses data from the `datasets/` directory. Trained models are saved and loaded from the `models/` directory.
- **Database (Potentially):** The `backend/app/db.py` and `backend/app/models.py` files suggest the use of a database (likely SQLAlchemy) to store chat history, user information (if implemented), and potentially analytics data.
- **Utilities:** `backend/app/utils.py` contains helper functions for tasks like logging, text cleaning, and spell correction.

## AI Model Training

The retrieval-based components of the chatbot are trained using the `backend/ai/train_model.py` script. This script typically performs the following steps:

1.  Loads text data from the specified data file (`datasets/data.txt` by default).
2.  Tokenizes the text into sentences using NLTK.
3.  Trains a TF-IDF vectorizer on the sentence tokens to create a representation of the knowledge base.
4.  Saves the trained vectorizer and the sentence tokens to files in the `models/` directory for later use by the chatbot.

(If generative models are used, a separate fine-tuning process would likely be involved, the details of which would depend on the specific model and data used.)

## Datasets

The `datasets/` directory contains the data sources used to train and inform the chatbot. The primary file is usually `data.txt`, which holds the main body of knowledge relevant to the Specific Health Area in Kenya. Other files, like `intents.json`, might be used for more structured interaction patterns or intent recognition.

## Documentation (`docs/`)

The `docs/` directory contains important documentation for the project:

- **`API_Documentation.md`:** Provides details on how to interact with the backend API endpoints, including request and response formats.
- **`Dataset_Description.md`:** Describes the data sources used and the preprocessing steps applied to prepare the data for model training.
- **`Model_Training.md`:** Explains the process of training the AI models used by the chatbot.

## Deployment (`deployment/`)

The `deployment/` directory contains files and instructions for deploying the RETRIEVAL-SHA-CHATBOT. The presence of a `Dockerfile` indicates that Docker can be used to containerize the application for easier deployment across different environments.

## Getting Started (Development)

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd RETRIEVAL-SHA-CHATBOT
    ```
2.  **Create a virtual environment (recommended):**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Linux/macOS
    venv\Scripts\activate  # On Windows
    ```
3.  **Install backend dependencies:**
    ```bash
    cd backend
    pip install -r requirements.txt
    cd ..
    ```
4.  **Install NLTK resources (if not already present):**
    Run the `train_model.py` script once, it will attempt to download necessary NLTK resources.
    ```bash
    cd backend/ai
    python train_model.py
    cd ../..
    ```
5.  **Train the retrieval model:**
    ```bash
    cd backend/ai
    python train_model.py
    cd ../..
    ```
6.  **Run the FastAPI backend:**
    ```bash
    cd backend/app
    uvicorn main:app --reload
    ```
    The API will be accessible at `http://127.0.0.1:8000`. You can view the interactive API documentation at `http://127.0.0.1:8000/docs`.

## Deployment (using Docker)

1.  **Ensure Docker is installed on your system.**
2.  **Navigate to the project root directory.**
3.  **Build the Docker image:**
    ```bash
    docker build -t rshachatbot-backend .
    ```
4.  **Run the Docker container:**
    ```bash
    docker run -p 8000:8000 rshachatbot-backend
    ```
    The application will be accessible at `http://localhost:8000`.

## Contributing

[Include guidelines for contributing to the project, such as reporting issues, suggesting features, and submitting pull requests.]

## License

[Specify the project's license if applicable.]

## Contact

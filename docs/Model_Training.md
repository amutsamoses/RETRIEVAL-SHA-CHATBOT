# Guide on how to train and fine-tune chatbot

# Information on training TF-IDF and Word2Vec models

│

# Chatbot Model Training Guide

This document outlines the process of training the AI models that power the SHA Chatbot. The chatbot employs a hybrid approach, potentially utilizing both retrieval-based techniques (e.g., TF-IDF and cosine similarity) and generative models (e.g., leveraging pre-trained models like those from the Transformers library).

## Hybrid Model Architecture

The SHA Chatbot's hybrid architecture aims to combine the strengths of different approaches:

- **Retrieval-Based:** For well-defined questions or information present in the knowledge base, the chatbot retrieves the most relevant pre-existing response. This often involves:
  - **Sentence Embeddings:** Representing sentences from the `data.txt` file as numerical vectors.
  - **TF-IDF (Term Frequency-Inverse Document Frequency):** A statistical measure used to evaluate the importance of a word in a collection of documents. It can be used to vectorize sentences based on word importance.
  - **Cosine Similarity:** A metric to measure the similarity between two vectors, used to find the most relevant sentence in the knowledge base to the user's query.
- **Generative (Potentially):** For more open-ended questions or when a direct match is not found, the chatbot might leverage a generative model (e.g., based on Transformer architectures like Gemini or others) to generate a novel response.

## Training Process

The training process involves several steps, primarily focused on preparing the data for the retrieval component:

### 1. Data Loading and Tokenization (`ai/train_model.py`)

- The `train_model.py` script loads the text data from `datasets/data.txt`.
- The text is then tokenized into individual sentences using `nltk.sent_tokenize`.

### 2. Vectorization (TF-IDF - `ai/hybrid_model.py`)

- The script initializes a `TfidfVectorizer` from the `sklearn.feature_extraction.text` library.
- The `fit()` method of the vectorizer is used to learn the vocabulary and IDF weights from the tokenized sentences.
- The `transform()` method is then used to convert the sentences into TF-IDF vectors, creating a numerical representation of the knowledge base.

### 3. Word Embeddings (Word2Vec - `ai/hybrid_model.py` - If Implemented)

- If Word2Vec is used, the training process would involve:
  - Tokenizing the text into words.
  - Training a Word2Vec model (e.g., using `gensim` library) on the word tokens to learn vector representations for each word based on its context.
  - Generating sentence embeddings by averaging or combining the word embeddings of the words in each sentence.

### 4. Saving Trained Models (`ai/train_model.py`)

- The trained `TfidfVectorizer` object (and potentially the Word2Vec model) are saved to pickle files (e.g., `tfidf_vectorizer.pkl`, `word2vec_model.pkl`) in the `models/` directory. This allows for efficient loading of the trained models during chatbot runtime without retraining.
- The tokenized sentences (`sentence_tokens.pkl`) are also saved for quick access.

## Fine-Tuning (If Generative Models are Used)

- If the chatbot incorporates a generative model, the training process would involve fine-tuning a pre-trained language model on a relevant dataset. This process typically requires more computational resources and a larger, more structured dataset of question-answer pairs. The specifics of fine-tuning would depend on the chosen generative model and the libraries used (e.g., Transformers library from Hugging Face).

## Running the Training Script

To train the retrieval-based components, you can run the `train_model.py` script from the `backend/ai` directory:

```bash
cd backend/ai
python train_model.py
```

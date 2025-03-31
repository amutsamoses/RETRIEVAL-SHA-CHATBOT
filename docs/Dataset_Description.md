# Documentation on data cleaning and preprocessing steps

# Dataset Description and Preprocessing

This document details the datasets used to train and inform the SHA Chatbot, as well as the steps taken to clean and preprocess this data.

## Data Sources

The chatbot's knowledge base is built upon information gathered from the following sources:

- **`datasets/data.txt`:** This file contains a collection of text data relevant to SHA (Specific Health Area - assuming this is the context), potentially including FAQs, informational articles, policy documents, and other textual resources. The data is structured as plain text.
- **`datasets/intents.json` (Potentially):** If the chatbot utilizes an intent recognition component (e.g., for more structured retrieval or generative responses), this file would contain a structured dataset of user intents and corresponding example queries and potential responses. The format is typically JSON.
- **Other Potential Sources:** [List any other data sources you might be using, e.g., CSV files, web scraping results, etc.]

## Data Cleaning and Preprocessing Steps

The raw data undergoes several cleaning and preprocessing steps to prepare it for training the AI models. These steps are crucial for improving the accuracy, relevance, and overall performance of the chatbot.

### 1. Text Cleaning (`utils.py` - `clean_text` function)

- **Lowercasing:** All text is converted to lowercase to ensure consistency and reduce the vocabulary size.
- **Punctuation Removal:** Punctuation marks are removed as they often do not contribute significantly to the meaning of the text for the models.
- **Whitespace Handling:** Extra whitespace (e.g., multiple spaces, tabs, newlines) is removed and replaced with single spaces.
- **Special Character Removal (Potentially):** Depending on the data, removal of specific special characters or symbols might be performed.
- **HTML Tag Removal (Potentially):** If the data contains HTML tags, these are removed to extract the raw text.

### 2. Spell Correction (`utils.py` - `correct_spelling` function)

- A basic spell correction mechanism is implemented to handle minor typographical errors in user input. This helps the chatbot understand queries even with slight misspellings. The approach might involve using libraries like `nltk.corpus.words` or more advanced techniques.

### 3. Sentence Tokenization (`ai/train_model.py`)

- The primary text data (`data.txt`) is split into individual sentences using the `nltk.sent_tokenize` function. These sentences form the basis for the retrieval component of the hybrid model.

### 4. Intent Recognition Data Preprocessing (If Applicable - `intents.json`)

- If using an `intents.json` file, the preprocessing might involve:
  - **Tokenization:** Splitting user query examples into individual words or subwords.
  - **Stemming/Lemmatization:** Reducing words to their root form to group similar meanings.
  - **Feature Extraction:** Converting the text data into numerical representations (e.g., using TF-IDF or word embeddings) suitable for machine learning models.

### 5. Handling Kenya-Specific Context

- The dataset is curated to include information relevant to SHA in the context of Kenya. This ensures that the chatbot's responses are tailored to the geographical scope of the application. This might involve prioritizing data sources specific to Kenya and filtering out irrelevant information.

### 6. Data Augmentation (Potentially)

- In some cases, techniques like paraphrasing or generating synthetic data might be used to increase the size and diversity of the training data.

## Data Storage

- The raw data is stored in the `datasets/` directory.
- Preprocessed sentence tokens are saved as a pickle file (`sentence_tokens.pkl`) in the `models/` directory for efficient loading during runtime.

## Future Improvements

- Explore more advanced data cleaning techniques (e.g., handling stop words, stemming/lemmatization for the main text data).
- Investigate methods for identifying and removing irrelevant or noisy data.
- Continuously update the dataset with new and relevant information to improve the chatbot's knowledge base.

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

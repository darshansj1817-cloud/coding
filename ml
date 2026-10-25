Tokenization and Removal of Stop Words Using NLTK
import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords

# Download required resources
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('punkt_tab')

# Input text
text = "This is a simple example demonstrating stopword removal in NLP."

# Tokenize words
tokens = word_tokenize(text)

# Load English stop words
stop_words = set(stopwords.words('english'))

# Remove stop words
filtered_tokens = [
    word for word in tokens
    if word.lower() not in stop_words
]

# Display filtered tokens
print("Filtered Tokens:", filtered_tokens)
#########
Tokenization Using spaCy
import spacy

# Load English language model
nlp = spacy.load("en_core_web_sm")

# Input text
text = "Hello! How are you today?"

# Process the text using spaCy NLP pipeline
doc = nlp(text)

# Extract individual tokens
tokens = [token.text for token in doc]

# Display tokens
print("Tokens:", tokens)

########
Lemmatization Using spaCy
import spacy

# Load the English language model
nlp = spacy.load("en_core_web_sm")

# Input text
text = "The children are playing games in the park"

# Process the text using spaCy
doc = nlp(text)

# Display each word and its lemma
for token in doc:
    print(f"{token.text} -> {token.lemma_}")

########
Python Program for Stemming and Lemmatization Using NLTK
import nltk
from nltk.stem import PorterStemmer, WordNetLemmatizer
from nltk.corpus import wordnet

# Download required resources
nltk.download('wordnet')
nltk.download('omw-1.4')

# Initialize stemmer and lemmatizer
stemmer = PorterStemmer()
lemmatizer = WordNetLemmatizer()

# Input words
words = ["playing", "studies", "running", "better", "cars"]

# Perform stemming and lemmatization
print("Word\t\tStem\t\tLemma")

for word in words:
    stem = stemmer.stem(word)
    lemma = lemmatizer.lemmatize(word)
    print(f"{word}\t\t{stem}\t\t{lemma}")
#######
Python Program to Generate constituency Syntax Tree Using spaCy
import spacy
from spacy import displacy

def generate_syntax_tree(sentence):
    # Load the English NLP model
    nlp = spacy.load("en_core_web_sm")

    # Process the sentence
    doc = nlp(sentence)

    # Print dependencies in a readable format
    for token in doc:
        print(f"{token.text:<12} {token.dep_:<12} "
              f"{token.head.text:<12} {token.head.pos_}")

    # Render the dependency tree
    displacy.render(doc, style="dep", jupyter=True)

# Example sentences
sentence = "The cat chased a dog in the park."
generate_syntax_tree(sentence)

sentence = "The little girl saw a big dog."
generate_syntax_tree(sentence)
######
Python Program to Illustrate Corpus Using NLTK
import nltk
from nltk.corpus import PlaintextCorpusReader
import os

# Create a sample corpus folder
os.makedirs('my_corpus', exist_ok=True)

# Create text files
with open('my_corpus/doc1.txt', 'w') as f:
    f.write("Hello world. This is a test file.")

with open('my_corpus/doc2.txt', 'w') as f:
    f.write("Natural Language Processing is very interesting. It helps computers understand human language.")

# Load the corpus
corpus_root = 'my_corpus'
corpus = PlaintextCorpusReader(corpus_root, r'.*\.txt')

# 1. List all files
print("Files in corpus:", corpus.fileids())

# 2. Display raw content
print("\nRaw content of first file:")
print(corpus.raw(corpus.fileids()[0]))

# 3. Display tokenized words
print("\nTokenized words from first file:")
print(corpus.words(corpus.fileids()[0]))

# 4. Display tokenized sentences
print("\nTokenized sentences from first file:")
print(corpus.sents(corpus.fileids()[0]))

# 5. Display all words in the corpus
print("\nAll words in corpus:")
for fileid in corpus.fileids():
    print(f"\n--- {fileid} ---")
    print(list(corpus.words(fileid)))
######
Python Program to Generate dependency Parse Tree for an English Sentence Using NLTK
import nltk
from nltk import CFG

# Define a Context-Free Grammar (CFG)
grammar = CFG.fromstring("""
    S -> NP VP
    NP -> Det Adj N
    VP -> V NP
    PP -> P NP

    Det -> 'the' | 'a'
    Adj -> 'little' | 'big'
    N -> 'cat' | 'dog' | 'park' | 'girl'
    V -> 'chased' | 'saw'
    P -> 'in' | 'on'
""")

# Create a parser
parser = nltk.ChartParser(grammar)

# Define a sentence
sentence = "the little girl saw a big dog".split()

# Generate and display the parse tree
for tree in parser.parse(sentence):
    tree.pretty_print()
#####

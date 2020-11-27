# nsml: nsml/ml:cuda10.1-cudnn7-pytorch1.3keras2.3

from distutils.core import setup

setup(
    name='kaist-korquad-test',
    version='1.0',
    install_requires=[
        'boto3', 'regex', 'sacremoses', 'filelock', 'tokenizers',
        'tqdm', 'konlpy', 'gluonnlp', 'sentencepiece==0.1.6', 'dataclasses',
        'transformers==3.0.2', 'torch==1.6.0', 'seqeval==0.0.12'
    ]
)

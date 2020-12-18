<h1 align="center">CS492 NLP Project</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
  <img src="https://img.shields.io/badge/pip-%3E%3D20.1.1-blue.svg" />
  <img src="https://img.shields.io/badge/python-%3E%3D3.7.7-blue.svg" />
  <img src="https://img.shields.io/badge/pytorch-%3E%3D1.6.0-blue.svg" />
  <a href="https://github.com/myoons/cs492-nlp-project" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="#" target="_blank">
    <img alt="License: CS492I 20F Team 18" src="https://img.shields.io/badge/License-CS492I Team 18-red.svg" />
  </a>
</p>

In this NLP task, we used variation of KoELECTRA to solve Open KorQuAD problem [1]. 

Project Contributor: [Yoonseo Kim ](https://github.com/myoons), [Yeji Han](https://github.com/yejihan-dev)

## Dataset

Dataset includes questions, answers, and multiple paragraphs corresponding to each question. The maximum number of document snippets is 25 as documents top five documents per each pre-defined category are retrieved. About 65% of the questions have answers in those snippets. 

## Setup

You can install this repository using `git clone`

    git clone https://github.com/myoons/cs492-nlp-project.git


If you are available using NSML, login with your github account

    nsml login

## Files

1. `setup.py` : Setting libraries to run the code in NSML
2. `run_squad.py` : main code for overall training
3. `open_squad_metrics.py` : Metrics for SQuAD
4. `open_squad.py` : Processing open KorQuAD dataset to examples
5. `run_local.sh` : Running the code in local
6. `run_nsml.sh` : Running the code in NSML (If Available)

## Training

If NSML is available

    sh run_nsml.sh

Training the model in LOCAL

    sh run_local.sh

## Major Flags

- -\-model_type : Model type selected
		1. default = None
		2. type =  str
		3. required = True

- -\-model_name_or_path : Path to pre-trained model or shortcut name selected
		1. default = None
		2. type =  str
		3. required = True

- -\-num_train_epochs : Total number of training epochs to perform
		 1. default = 3.0
		 2. type = float

- -\-learning_rate : The initial learning rate for Adam
		1. default = 5e-5
		2. type = float

- -\-max_seq_length : The maximum total input sequence length after WordPiece tokenization
		1. default = 384
		2. type = int
		
- -\ -version_2_with_negative : If true, the SQuAD examples contain some that do not have an answer
		1. action = store_true

- -\-n_best_size 20 : The total number of n-best predictions to generate in the nbest_predictions.json output file
		1. default = 20
		2. type = int

- -\-null_score_diff_threshold : If null_score - best_non_null is greater than the threshold predict null
		1. type = float
		2. default = 0.0

## Reference
## Reference
[1] **[## ELECTRA: Pre-training Text Encoders as Discriminators Rather Than Generators](https://arxiv.org/abs/2001.07685)** by Kevin Clar, Minh-Thang Luong, Quoc V. Le, Christopher D. Manning

[2] **[KoELECTRA - Github](https://github.com/monologg/KoELECTRA)** by monologg

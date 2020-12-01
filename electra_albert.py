class BertEnsembleForNextSentencePrediction(BertPreTrainedModel):
    def __init__(self, config, *args, **kwargs):
        super().__init__(config)

        self.n_models = kwargs["n_models"]

        self.bert_model_1 = BertModel(config)
        self.bert_model_2 = BertModel(config)

        self.cls = nn.Linear(self.n_models * self.config.hidden_size, 2)
        self.init_weights()

    def forward(
            self,
            input_ids=None,
            attention_mask=None,
            token_type_ids=None,
            position_ids=None,
            head_mask=None,
            inputs_embeds=None,
            next_sentence_label=None,
    ):
        outputs = []
        input_ids_1 = input_ids[0]
        attention_mask_1 = attention_mask[0]
        token_type_ids_1 = token_type_ids[0]
        outputs.append(self.bert_model_1(input_ids_1,
                                         attention_mask=attention_mask_1,
                                         token_type_ids=token_type_ids_1))

        input_ids_2 = input_ids[1]
        attention_mask_2 = attention_mask[1]
        token_type_ids_2 = token_type_ids[1]
        outputs.append(self.bert_model_2(input_ids_2,
                                         attention_mask=attention_mask_2,
                                         token_type_ids=token_type_ids_2))

        # just get the [CLS] embeddings
        last_hidden_states = torch.cat([output[1] for output in outputs], dim=1)
        logits = self.cls(last_hidden_states)

        # crossentropyloss: https://pytorch.org/docs/stable/nn.html#crossentropyloss
        if next_sentence_label is not None:
            loss_fct = nn.CrossEntropyLoss(ignore_index=-1)
            next_sentence_loss = loss_fct(logits.view(-1, 2), next_sentence_label.view(-1))
            return next_sentence_loss, logits
        else:
            return logits
from sentence_transformers import SentenceTransformer

if __name__ == "__main__":
    model = SentenceTransformer(
        model_name_or_path="",
        model_kwargs={"torch_dtype": "auto"},
    )
    print(f"model[0].auto_model.config: {model[0].auto_model.config}")

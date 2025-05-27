import torch
from transformers import AutoModel, AutoTokenizer
# from sentence_transformers import SentenceTransformer


def load_model(model_path: str) -> AutoModel:
    print("=== load_model ==================================================")

    model = AutoModel.from_pretrained(
        pretrained_model_name_or_path=speeda_model_path,
        torch_dtype="auto",
    )
    model.eval()
    print(f"model: {model}")
    print(f"model.config: {model.config}")
    # model = SentenceTransformer(
    #     model_name_or_path="/home/uzabase/jupyter-server/workspace/orca/experiments/release/044_merged_quantized/model",
    #     model_kwargs={"torch_dtype": "auto"},
    # )
    # auto_model = model[0].auto_model
    # print(f"model[0].auto_model: {auto_model}")
    # print(f"model[0].auto_model.config: {auto_model.config}")

    return model


def load_tokenizer(model_path: str) -> AutoTokenizer:
    print("=== load_tokenizer ==================================================")

    tokenizer = AutoTokenizer.from_pretrained(speeda_model_path)
    print(f"tokenizer: {tokenizer}")

    return tokenizer


def save_model_to_pt(model: AutoModel, output_path: str) -> None:
    print("=== save_model_to_pt ==================================================")
    try:
        scripted_model = torch.jit.script(model)
        torch.jit.save(scripted_model, output_path)
        print(f"Model saved to {output_path}")
    except Exception as e:
        print(f"Error during scripting: {e}")


if __name__ == "__main__":
    speeda_model_path = "/home/uzabase/jupyter-server/workspace/orca/experiments/release/044_merged_quantized/model"

    model = load_model(speeda_model_path)
    tokenizer = load_tokenizer(speeda_model_path)

    save_model_to_pt(model, "044_merged_quantized_scripted.pt")

from fastapi import FastAPI, HTTPException
# from transformers import GPT2LMHeadModel, GPT2Tokenizer
# import uvicorn
app = FastAPI()


@app.post("/generate-text")
def generate_text(request_data: dict):
    return {"generated_text": 'Hello Brother!!!'}
    # try:
    #     trained_models_path = request_data["trained_models_path"]
    #     input_text = request_data["input_text"]

    #     # Load the model and tokenizer using the provided path
    #     model = GPT2LMHeadModel.from_pretrained(trained_models_path)
    #     tokenizer = GPT2Tokenizer.from_pretrained(trained_models_path)

    #     # Tokenize input text
    #     input_ids = tokenizer.encode(input_text, return_tensors="pt")

    #     # Generate text
    #     output = model.generate(
    #         input_ids,
    #         max_length=request_data["max_length"],
    #         num_beams=request_data["num_beams"],
    #         no_repeat_ngram_size=request_data["no_repeat_ngram_size"],
    #         top_k=request_data["top_k"],
    #         top_p=request_data["top_p"],
    #         do_sample=request_data["do_sample"],
    #         temperature=request_data["temperature"],
    #         eos_token_id=model.config.pad_token_id,
    #     )

    #     # Decode and return generated text
    #     generated_text = tokenizer.decode(output[0], skip_special_tokens=True)
    #     return {"generated_text": generated_text}
    # except Exception as e:
    #     raise HTTPException(status_code=500, detail=str(e))


# if __name__ == "__main__":
#     uvicorn.run(app, host="localhost", port=8000)

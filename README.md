# MoTE: Mixture of Ternary Experts for Memory-efficient Large Multimodal Models
[[paper]]() [[model]]() [[code]](https://github.com/ustcwhy/MoTE)

- June 2025: [MoTE: Mixture of Ternary Experts for Memory-efficient Large Multimodal Models]()

## Evaluation

We use the [LMM-Eval]() toolkit to conduct evaluations on VQA tasks. We provide the [transformers repo]() in which we modify the [modeling_qwen2_moe.py]() to support the W1.58-A8 experts. 

The evaluation should use nvidia_24_07 docker. Install the packages:

```bash
docker run --name nvidia_24_07  --privileged --net=host --ipc=host --gpus=all -v /mnt:/mnt -v /tmp:/tmp -d nvcr.io/nvidia/pytorch:24.07-py3 sleep infinity # only use for multimodal evaluation
docker exec -it nvidia_24_07 bash
git clone https://github.com/ustcwhy/MoTE.git
cd MoTE/
bash vl_eval_setup.sh # only use for multimodal evaluation
```

First, download the MoTE-1.5B-bf16 model from HuggingFace:

```bash
git clone https://huggingface.co/hongyuw/MoTE-1.5B-bf16
```

Then run the following scripts to conduct evaluations:

```bash
cd lmms-eval/
bash eval-moe.sh /YOUR_PATH_TO_EXP/MoTE-1.5B-bf16
```

Note that we provide the master weights of MoTE-1.5B and perform online quantization. For actual memory savings and speedup, you may quantize the weights offline to 1.58-bit precision. We recommend using the [bitnet.cpp](https://github.com/microsoft/bitnet) inference framework to accurately measure the reduction in inference cost.

## Acknowledgement

This repository is built using [LMM-Eval](https://github.com/EvolvingLMMs-Lab/lmms-eval) and [the HuggingFace's transformers](https://github.com/huggingface/transformers).

## License
This project is licensed under the MIT License.

### Contact Information

For help or issues using models, please submit a GitHub issue.

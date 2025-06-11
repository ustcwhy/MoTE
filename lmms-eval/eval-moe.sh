set -ex


export OPENAI_API_KEY=YOUR_OPENAI_API_KEY

FINAL_RUN_NAME=$1

CUDA_VISIBLE_DEVICES=0 accelerate launch --num_processes=1 -m lmms_eval --model llava_hf --model_args pretrained=${FINAL_RUN_NAME},attn_implementation=eager,device_map=auto,dtype=bfloat16 --tasks mmmu_val --batch_size 1 --log_samples --log_samples_suffix mmmu_val --output_path ${FINAL_RUN_NAME}/mmmu_val &
# CUDA_VISIBLE_DEVICES=1 accelerate launch --num_processes=1 -m lmms_eval --model llava_hf --model_args pretrained=${FINAL_RUN_NAME},attn_implementation=eager,device_map=auto,dtype=bfloat16 --tasks mmstar --batch_size 1 --log_samples --log_samples_suffix mmstar --output_path ${FINAL_RUN_NAME}/mmstar &
# CUDA_VISIBLE_DEVICES=2 accelerate launch --num_processes=1 -m lmms_eval --model llava_hf --model_args pretrained=${FINAL_RUN_NAME},attn_implementation=eager,device_map=auto,dtype=bfloat16 --tasks seedbench --batch_size 1 --log_samples --log_samples_suffix seedbench --output_path ${FINAL_RUN_NAME}/seedbench &
# CUDA_VISIBLE_DEVICES=3 accelerate launch --num_processes=1 -m lmms_eval --model llava_hf --model_args pretrained=${FINAL_RUN_NAME},attn_implementation=eager,device_map=auto,dtype=bfloat16 --tasks mmbench_en_test --batch_size 1 --log_samples --log_samples_suffix mmbench_en_test --output_path ${FINAL_RUN_NAME}/mmbench_en_test &
# CUDA_VISIBLE_DEVICES=0 accelerate launch --num_processes=1 -m lmms_eval --model llava_hf --model_args pretrained=${FINAL_RUN_NAME},attn_implementation=eager,device_map=auto,dtype=bfloat16 --tasks mathvista_testmini_solution --batch_size 1 --log_samples --log_samples_suffix mathvista_testmini_solution --output_path ${FINAL_RUN_NAME}/mathvista_testmini_solution &
# CUDA_VISIBLE_DEVICES=1 accelerate launch --num_processes=1 -m lmms_eval --model llava_hf --model_args pretrained=${FINAL_RUN_NAME},attn_implementation=eager,device_map=auto,dtype=bfloat16 --tasks mmvet --batch_size 1 --log_samples --log_samples_suffix mmvet --output_path ${FINAL_RUN_NAME}/mmvet &
wait
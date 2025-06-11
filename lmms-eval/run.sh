set -ex

# 显存总阈值（单位：MB）
THRESHOLD=10240  # 10GB = 10240MB

while true; do
    # 查询所有GPU的显存使用情况（单位MB），并累加
    total_used=0
    while read used; do
        total_used=$((total_used + used))
    done < <(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)

    echo "$(date): Total GPU memory used: ${total_used}MB"

    if [ "$total_used" -lt "$THRESHOLD" ]; then
        echo "$(date): Total used memory ${total_used}MB is less than ${THRESHOLD}MB. Running target script..."
        bash /home/lidong1/hongyu/vlm-eval/lmms-eval/eval-moe-vis.sh qwen2.5-1.5b-instruct-siglipL-384px-1e-4-256-101-moe4-top1-freq1-stage3-mamoth_vl-share_ffn-moe_ft-copy_ffn-binary checkpoint_1_12500
        exit 0
    fi

    # 每10秒检查一次
    sleep 10
done
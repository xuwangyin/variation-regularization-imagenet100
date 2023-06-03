python="/data/$(whoami)/anaconda3/envs/corruptions/bin/python"

srun --job-name="imagenet100-lp-vr" --time=2-00:00:00 --gpus=1  \
$python -u train_imagenette.py --epochs 200 --var-reg-type var \
    --norm l_2 --epsilon 128 --pgd-alpha 19.125 --var-reg 1 \
    --data-dir /data/$(whoami)/Projects/adversarial-corruptions/datasets/imagenet100 --logits-reg --fname imagenet100_lp_vr | tee imagenet100_lp_vr.log

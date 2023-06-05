# Based on https://github.com/inspire-group/variation-regularization/tree/main/train
python="/data/$(whoami)/anaconda3/envs/corruptions/bin/python"

for reg in 1.0 0 0.1 0.5 0.3; do
    sleep 2
    srun --job-name="imagenet100-l2-vr-$reg" --time=2-00:00:00 --gpus=4 --nodes=1 \
        $python -u train_imagenette.py --var-reg-type var \
        --norm l_2 --epsilon 128 --pgd-alpha 19.125 --var-reg $reg \
        --data-dir /data/$(whoami)/Projects/adversarial-corruptions/datasets/imagenet100 --logits-reg --fname imagenet100_l2_vr_$reg
done

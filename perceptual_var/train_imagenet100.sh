python="/data/$(whoami)/anaconda3/envs/corruptions/bin/python"

for reg in 0.1 0.3 0.5 1.0; do
    srun --job-name="imagenet100-PAT_VR-$reg" --time=2-00:00:00 --gpus=1  \
       $python -u adv_train_var.py --arch resnet50  --dataset imagenet100 \
       --continue --log_dir imagenet100_var --alexnet --var_reg $reg \
       --dataset_path /data/$(whoami)/Projects/adversarial-corruptions/datasets/imagenet \
       --attack "FastLagrangePerceptualAttack(model, bound=0.5, lpips_model='self', num_iterations=10)" \
       --only_attack_correct | tee "imagenet100-PAT_VR-$reg".log &
done

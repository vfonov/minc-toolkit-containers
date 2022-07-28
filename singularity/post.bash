set -o errexit

# Fill this file with your environment creation
mamba create --quiet  --yes -n minc -c minc-forge \
    python=3.9 minc2-simple=0.2.30 minc-toolkit-v2=1.9.18.3=noblas_novisual_h1234567_0 \
    scikit-learn scikit-image  imagemagick matplotlib-base \
    scipy ray-default 

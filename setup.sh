set -e

wget https://rwth-aachen.sciebo.de/s/RapAoed1dxG1PMs/download -O large_models.zip
unzip large_models.zip -d large_models

echo "Moving large benchmark files"
cd large_models/vnncomp2024/
for d in *
do
    cd $d/seed_896832480/;
    mkdir -p ../../../../benchmarks/$d/onnx
    mkdir -p ../../../../benchmarks/$d/vnnlib
    find . -type f -exec mv "{}" "../../../../benchmarks/$d/{}" \;
    cd ../../;
done
cd ../..
rm -r large_models large_models.zip

echo "Unzipping"
gunzip -r benchmarks/

echo "CREATING HARDCODED SYMLINKS FOR BROKEN BENCHMARKS"
ln -sf ../../nn4sys_2023/onnx/mscn_2048d.onnx benchmarks/nn4sys/onnx/mscn_2048d.onnx
ln -sf ../../nn4sys_2023/onnx/mscn_2048d_dual.onnx benchmarks/nn4sys/onnx/mscn_2048d_dual.onnx
ln -sf ../../vggnet16_2023/onnx/vgg16-7.onnx benchmarks/vggnet16_2022/onnx/vgg16-7.onnx 

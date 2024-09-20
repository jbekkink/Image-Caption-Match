IMG_NAME=id
IMG_FROM=${IMG_NAME}:non-tee
IMG_TO=joeyiexec/${IMG_NAME}:tee

docker build . -t ${IMG_FROM}

docker run -it \
            -v /var/run/docker.sock:/var/run/docker.sock \
            registry.scontain.com/scone-production/iexec-sconify-image:5.7.6-v15 \
            sconify_iexec \
            --base=ubuntu:20.04 \
            --name=${IMG_NAME} \
            --from=${IMG_FROM} \
            --to=${IMG_TO} \
            --binary-fs \
            --fs-dir=/app \
            --host-path=/etc/hosts \
            --host-path=/etc/resolv.conf \
            --binary=/root/miniconda/bin/python3.8 \
            --fs-dir=/root/miniconda/lib/ \
            --heap=4610612736 \
            --dlopen=1 \
            --no-color \
            --verbose \
            --debug \
            && echo -e "\n------------------\n" \
            && echo "successfully built TEE docker image => ${IMG_TO}" \
            && echo "application mrenclave.fingerprint is $(docker run -it --rm -e SCONE_HASH=1 ${IMG_TO})"
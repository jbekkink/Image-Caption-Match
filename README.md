# Image Description Matcher
This Decentralized application (dApp), performs a check whether the uploaded image matches a provided image description by the image uploader, 
to verify whether this description is accurate or not. 
The current dApp uses the BLIP model, provided by huggingface (https://huggingface.co/docs/transformers/en/model_doc/blip)
Further, the dApp leverages Confidential Computing, in order to confidentially perform the computation on the uploaded image, which should remain private. 
This dApp can incentivize image uploaders to provide an accurate image description, to obtain a high similarity score. 

### Input 
The dApp takes two inputs namely an iExec dataset and the image description. 

- iExec Dataset (private): an encrypted file, which only gets decrypted inside the enclave, ensuring no data gets revealed to anyone. 
- image description (public): an app argument (string), which describes the image 

### Output 
The (public) output the dApp produces is the similarity score of the image and text description, which is a number between 0 and 100 with 0 being the lowest, and 100 the highest.

### Run dapp 

- Dapp Address: 

```shell 
    iexec app run 0x... --dataset 0x... --tag tee,scone 
```
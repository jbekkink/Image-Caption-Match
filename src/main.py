import json 
import os
from os.path import join
from similarity_score import SimilarityScore
import sys 

input_directory = os.environ["IEXEC_IN"]
output_directory = os.environ["IEXEC_OUT"]

def writeOutput(score): 
    """
        Write the outputs to the iexec output directory
        
        Args: 
            score: the similarity score
    """
    with open(output_directory + '/result.txt', 'w+') as fout:
        fout.write(score)
    with open(output_directory + '/computed.json', 'w+') as f:
        json.dump({ "deterministic-output-path" : output_directory + '/result.txt' }, f)
    return
        
if __name__ == '__main__':    
    outputs = ""
    if len(sys.argv) < 1: 
        outputs = "No description provided"

    image_path = ""
    for _, image in enumerate(os.listdir(input_directory)):
        if image.endswith((".jpg", ".JPG")):
            image_path = join(input_directory, image)
    if image_path == "": 
        outputs = "No image (jpg) provided"
    
    else: 
        description =str(sys.argv[1])
        outputs = SimilarityScore(image_path, description)

    writeOutput(str(outputs))
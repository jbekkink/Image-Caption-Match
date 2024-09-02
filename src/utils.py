from transformers import BlipProcessor, TFBlipForImageTextRetrieval
import tensorflow as tf
from PIL import Image
import requests

def loadImage(image_path): 
    return Image.open(image_path).convert('RGB')

def loadModelAndProcessor(): 
    """ 
        Load the model and processor from the pretrained BLIP model
        This model is specifically used for image-text retrieval tasks, so this model is used to get the similarity score
    """
    model = TFBlipForImageTextRetrieval.from_pretrained("Salesforce/blip-itm-base-coco")
    processor = BlipProcessor.from_pretrained("Salesforce/blip-itm-base-coco")
    return model, processor

@tf.function 
def forward(model, inputs): return model(**inputs)
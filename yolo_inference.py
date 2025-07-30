from ultralytics import YOLO
import torch

model = YOLO('yolov8x')

if torch.cuda.is_available():
    model.to('cuda')
    print("Model moved to CUDA")
elif torch.mps.is_available():
    model.to('mps')
    print("Model moved to MPS")
else:
    model.to('cpu')
    print('Model moved to CPU')

results = model.predict('input_videos/test.mp4', save=True)
print(results[0])
print('=================================')
for box in results[0].boxes:
    print(box)
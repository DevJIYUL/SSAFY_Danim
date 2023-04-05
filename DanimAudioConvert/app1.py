import numpy as np
from keras.models import load_model
from flask import Flask, request,Response
import json
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)


# CAMERA can be 0 or 1 based on default camera of your computer.
# camera = cv2.VideoCapture(0, cv2.CAP_DSHOW)

# # Grab the labels from the labels.txt file. This will be used later.
# labels = open('labels.txt', 'r', encoding='UTF8').readlines()
#
# # Load the model
# model = load_model('model.h5')


@app.route("/", methods=["POST"])
def index():
    global d_model, d_labels
    # upfiles\4\model.h5
    # upfiles\4\level.txt
    # 여기에서 위 두개의 파일이 모두 존재를 하는지 판단을 해봐야 함
    re = request

    dd = request.get_json()
    uid = dd["uid"]
    path1 = os.path.join("upfiles", uid, "labels.txt")
    path2 = os.path.join("upfiles", uid, "model.h5")
    pass_next = False

    if uid in d_model and uid in d_labels:
        pass_next = True
    if not pass_next:
        # 이때는 넘어가지 못하는 거임
        return json.dumps("None", ensure_ascii=False)

    # Grab the labels from the labels.txt file. This will be used later.
    labels = d_labels[uid]
    # Load the model
    model = d_model[uid]

    # 위두개의 파일이 없다면 진행을 할수가 없으니 진행하면 안됨

    # print(request)
    # print(request.data)
    json_data = request.get_json()
    # print(type(json_data), json_data["img"])

    # dict_data = json.loads(json_data)
    # img = dict_data['img']

    img = json_data["img"]
    # img = base64.b64decode(img)
    # img = BytesIO(img)
    # img = Image.open(img)

    # use numpy to convert the pil_image into a numpy array
    numpy_image = np.array(img)

    # convert to a openCV2 image and convert from RGB to BGR format
    # opencv_image = cv2.cvtColor(numpy_image, cv2.COLOR_RGB2BGR)
    #
    # # Resize the raw image into (224-height,224-width) pixels.
    # image = cv2.resize(opencv_image, (224, 224), interpolation=cv2.INTER_AREA)

    # Make the image a numpy array and reshape it to the models input shape.

    # 이렇게 한이유는 array로 변환을 못할시에 에러가 나는데 이럴 경우에는 다시 서버에서 알려주기 위해서 이렇게 작성을 하였다.
    try:
        image = np.asarray(numpy_image, dtype=np.float32).reshape(1, 224, 224, 3)
    except:
        return json.dumps("None", ensure_ascii=False)

    # Normalize the image array
    image = (image / 127.5) - 1

    # Have the model predict what the current image is. Model.predict
    # returns an array of percentages. Example:[0.2,0.8] meaning its 20% sure
    # it is the first label and 80% sure its the second label.
    probabilities = model.predict(image)
    # Print what the highest value probabilitie label

    np.set_printoptions(precision=3, suppress=True)
    print(probabilities)

    # 제일 높은 확률이 80%이상이면 출력
    if (max(map(max, probabilities)) > 0.8):
        return json.dumps(labels[np.argmax(probabilities)][2:len(labels[np.argmax(probabilities)]) - 1],
                          ensure_ascii=False)
    else:
        return json.dumps("None", ensure_ascii=False)


@app.route("/hihi", methods=["POST"])
def index1():
    global d_labels, d_model
    file = request.files['file']
    filename = secure_filename(file.filename)
    os.makedirs((str)(os.path.join("upfiles", request.headers['title'])), exist_ok=True)
    file.save(os.path.join("upfiles", request.headers['title'], filename))
    # print(os.path.join("upfiles",request.headers['title'], filename))

    uid = request.headers['title']

    if filename == "labels.txt":
        d_labels[uid] = []
        d_labels[uid] = (
            open(os.path.join("upfiles", request.headers['title'], filename), 'r', encoding='UTF8').readlines())
    else:
        d_model[uid] = []
        d_model[uid] = load_model(os.path.join("upfiles", request.headers['title'], filename))

    return os.path.join("upfiles", request.headers['title'], filename)


print(__name__)

idx = 0

pathz = os.path.join("upfiles")
d_labels = dict()
d_model = dict()

if (os.path.exists(pathz)):
    filenames = os.listdir(pathz)
    for filename in filenames:
        full_filename = os.path.join(pathz, filename)
        d_labels[filename] = []
        d_model[filename] = []
        filenow = os.listdir(full_filename)
        for now in filenow:
            temp_route = os.path.join("upfiles", filename, now)
            if now == "labels.txt":
                d_labels[filename] = (open(temp_route, 'r', encoding='UTF8').readlines())
            else:
                d_model[filename] = load_model(temp_route)

app.debug = True
app.run(host="localhost", port=5000, use_reloader=False)

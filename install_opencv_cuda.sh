cmake -S opencv \
    -B ./opencv/build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr/local/opencv-4.11.0 \
    -D OPENCV_EXTRA_MODULES_PATH=/path/to/opencv_contrib/modules \
    -D WITH_CUDA=ON \
    -D WITH_FFMPEG=OFF \
    -D ENABLE_FAST_MATH=ON \
    -D CUDA_FAST_MATH=ON \
    -D WITH_CUBLAS=ON \
    -D OPENCV_DNN_CUDA=OFF \
    -D WITH_TBB=ON \
    -D WITH_V4L=ON \
    -D WITH_QT=ON \
    -D WITH_OPENGL=ON \
    -D CUDA_ARCH_BIN=8.9 \
    -D CUDA_ARCH_PTX="" \
    -D CMAKE_CXX_STANDARD=17 \
    -D WITH_PYTHON=ON \
    -D PYTHON3_EXECUTABLE=/path/to/.venv/bin/python3 \
    -D PYTHON3_INCLUDE_DIR=$(uv run python -c "import sysconfig; print(sysconfig.get_paths()['include'])") \
    -D PYTHON3_LIBRARY=$(uv run python -c "import sysconfig; print(sysconfig.get_paths()['platlib'])") \
    -D PYTHON3_PACKAGES_PATH=$(uv run python -c "import sysconfig; print(sysconfig.get_paths()['purelib'])") \
    ..
cmake --build opencv/build/ -j32
sudo cmake --install opencv/build/

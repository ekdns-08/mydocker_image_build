# FROM nginx:latest
# LABEL maintainer "Author <Author@localhost.com>"
# ADD index.html /usr/share/nginx/html


# Python 이미지를 기반으로 함
FROM python:3.8-slim

# 작업 디렉토리 설정
WORKDIR /app

# 필요한 파일 복사
COPY app.py ./
COPY requirements.txt ./

# 필요한 Python 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# 컨테이너가 리스닝할 포트 지정
EXPOSE 80

# 애플리케이션 실행
CMD ["python", "./app.py"]

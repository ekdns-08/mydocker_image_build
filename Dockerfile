# FROM nginx:latest
# LABEL maintainer "Author <Author@localhost.com>"
# ADD index.html /usr/share/nginx/html


# Node.js의 공식 이미지를 기반으로 설정
FROM node:14

# 앱 디렉토리 생성
WORKDIR /usr/src/app

# 앱 의존성 설치
# package.json과 package-lock.json을 모두 복사
COPY package*.json ./

RUN npm install
# 프로덕션을 위한 코드라면
# RUN npm ci --only=production

# 앱 소스 추가
COPY . .

# 앱이 8080 포트에서 실행됨을 알림
EXPOSE 8080

CMD [ "node", "server.js" ]

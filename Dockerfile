# 베이스 이미지
FROM python:3.10-slim

# 작업 디렉터리 생성
WORKDIR /app

# 앱 파일 복사
COPY . /app

# 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# 포트 노출
EXPOSE 5000

# 앱 실행
CMD ["python", "app.py"]

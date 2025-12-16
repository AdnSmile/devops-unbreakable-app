from flask import Flask
import os
import redis

app = Flask(__name__)

# Sambungkan ke Redis
# Perhatikan host='redis'. Ini bukan magic, ini nama service di docker-compose nanti.
cache = redis.Redis(host='redis', port=6379)


@app.route('/')
def hello():
	app_name = os.getenv('APP_NAME', 'Aplikasi Tanpa Nama')
	
	# Hitung jumlah kunjungan
	try:
		count = cache.incr('hits')
	except redis.exceptions.ConnectionError as e:
		return f"Error connect ke Redis: {e}"

	return f"Halo! {app_name} telah dilihat {count} kali."

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=5000)

# Menggunakan base image Node.js versi 14
FROM node:14

# Menentukan direktori kerja di dalam container
WORKDIR /app

#  Menyalin source code aplikasi ke dalam container
COPY . .

# Menentukan Environment variable untuk aplikasi
ENV NODE_ENV=production
ENV DB_HOST=localhost

# Install dependencies aplikasi untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Menentukan port yang akan digunakan oleh aplikasi
EXPOSE 8080

# Menjalankan aplikasi
CMD ["npm", "start"]
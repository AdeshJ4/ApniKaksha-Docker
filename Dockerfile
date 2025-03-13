# Use a lightweight Node.js image
FROM node:20-alpine

# Set environment variables
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=qwerty \
    PORT=5000

# Set the working directory inside the container
WORKDIR /testapp

# Copy package.json first for better caching, The command effectively copies package.json (host) to /testapp/package.json inside the container.
# "./" → This is the destination, meaning "copy into the current working directory (WORKDIR /testapp) of the container."
COPY package.json ./

# Install dependencies inside the container
RUN npm install

# Copy all other project files (server.js, etc.)   In Docker, . and ./ are the same. Refers to the current directory.
COPY . . 

# Expose port 5000 (to match ENV PORT)
EXPOSE 5000

# Run the application
CMD ["node", "server.js"]




# FROM node:20-alpine

# ENV MONGO_DB_USERNAME=admin \
#     MONGO_DB_PWD=qwerty

# WORKDIR /testapp

# COPY . .  

# CMD [ "node", "./server.js" ]


# FROM node:20-alpine

# ENV MONGO_DB_USERNAME=admin \
#     MONGO_DB_PWD=qwerty

# WORKDIR /

# COPY . /testapp 

# CMD [ "node", "/testapp/server.js" ]  



# FROM node:20-alpine

# ENV MONGO_DB_USERNAME=admin \
#     MONGO_DB_PWD=qwerty

# RUN mkdir -p testapp

# COPY . /testapp

# CMD ['node', "/testapp/server.js"]





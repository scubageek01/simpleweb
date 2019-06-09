# Base image node:alpine
FROM node:alpine

# Define the working directory inside the container
WORKDIR /usr/app

# Copy the package.json file from the curreent directory into the containers
# IMPORTANT: The step below includes only package.json in order to run npm install.
#   This helps avoid unnecessary rebuild, rerunning the npm install, which can be a long process
COPY ./package.json ./

# Install all dependencies listed in the package.json
RUN npm install

# Copy all files into the working directory (/usr/app)
COPY ./ ./

# Startup command
CMD ["npm", "start"]

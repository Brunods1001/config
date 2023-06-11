# Use Alpine Linux as a base image
FROM alpine:3.13 AS builder  

# Set the maintainer label (replace with your name or email)
LABEL maintainer="Your Name <your.email@example.com>"  

# Set build arguments
ARG BUILD_DEPS="autoconf automake cmake curl g++ gettext gettext-dev git libtool make ninja openssl pkgconfig unzip binutils wget"  
ARG TARGET=stable  

# Install dependencies and build Neovim from source
RUN apk add --no-cache ${BUILD_DEPS} && \  
  git clone https://github.com/neovim/neovim.git /tmp/neovim && \  
  cd /tmp/neovim && \  
  git fetch --all --tags -f && \  
  git checkout ${TARGET} && \  
  make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr/local/ && \  
  make install && \  
  strip /usr/local/bin/nvim  

# Start a new stage to minimize the final image size
FROM alpine:3.13  

# Copy Neovim from the builder stage
COPY --from=builder /usr/local /usr/local/  
RUN true # see: https://github.com/moby/moby/issues/37965  

# Copy required shared libraries  
COPY --from=builder /lib/ld-musl-x86_64.so.1 /lib/  
RUN true  
COPY --from=builder /usr/lib/libgcc_s.so.1 /usr/lib/  
RUN true  
COPY --from=builder /usr/lib/libintl.so.8 /usr/lib/  

# Copy your Neovim configuration files
COPY .config /root/.config

# Set Neovim as the default command
CMD ["/usr/local/bin/nvim"]

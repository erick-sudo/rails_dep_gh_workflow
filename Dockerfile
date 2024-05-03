# Pull the latest ruby image
FROM ruby:latest

# Set the working directory
WORKDIR /app

# Copy Gemfile
COPY Gemfile /Gemfile

# Install dependencies
RUN gem install bundler && bundle install

# Copy the rest of the Rails application files to the container
COPY . .

# Copy the custom entrypoint script to the container
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Set the entrypoint to the custom script
ENTRYPOINT ["entrypoint.sh"]

# Start the application
CMD ["rails", "s", "-b", "0.0.0.0", "-p", "4000"]
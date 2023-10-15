# Use the rocker/shiny base image
FROM rocker/shiny

# Install required R packages
RUN R -e "install.packages('shinythemes')"
RUN R -e "install.packages('httr')"
RUN R -e "install.packages('XML')"
RUN R -e "install.packages('magrittr')"
RUN R -e "install.packages('xml2')"
RUN R -e "install.packages('rvest')"
RUN R -e "install.packages('iotools')"
RUN R -e "install.packages('DT')"
RUN R -e "install.packages('jsonlite')"
RUN R -e "install.packages('qrcode')"

# Copy the contents of your app directory to the image
COPY ./app /srv/shiny-server/app

# Expose port 3838 to the host
EXPOSE 3838

# Set the command to run your Shiny app
CMD ["/usr/bin/shiny-server"]
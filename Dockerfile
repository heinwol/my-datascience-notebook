FROM jupyter/datascience-notebook:latest

USER root

ENV GRANT_SUDO=yes
ENV JUPYTER_TOKEN='0000'

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y fish neovim bat python3-plotly graphviz
RUN pip install glom lenses

# for resource networks
RUN pip install array_to_latex cairosvg

COPY jupyter-config .

# https://discourse.jupyter.org/t/customizing-shell-launched-by-terminal/3412
RUN cat jupyter-config/jupyter_notebook_config.py >> /etc/jupyter/jupyter_notebook_config.py

#USER jovyan



WORKDIR "${HOME}"

# docker build . -t my-jupyter-image
# docker run --name my-datasciense-notebook -it --user root -p 8889:8888 -v ~/Documents:/home/jovyan/Documents my-jupyter-image

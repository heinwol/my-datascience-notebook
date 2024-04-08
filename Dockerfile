FROM jupyter/datascience-notebook:latest

USER root

ENV GRANT_SUDO=yes
ENV JUPYTER_TOKEN='0000'

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y fish neovim bat python3-plotly graphviz python3-pygraphviz
RUN pip install glom lenses plotly black[jupyter] returns

# for resource networks
RUN pip install array_to_latex cairosvg

COPY jupyter-config .

# https://discourse.jupyter.org/t/customizing-shell-launched-by-terminal/3412
RUN cat jupyter_notebook_config.py >> /etc/jupyter/jupyter_notebook_config.py
RUN conda init fish

RUN chown -R jovyan /home/jovyan/ 

#USER jovyan
WORKDIR "${HOME}"

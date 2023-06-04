FROM jupyter/datascience-notebook

USER root

ENV GRANT_SUDO=yes
ENV JUPYTER_TOKEN='0000'

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y fish neovim bat plotly
RUN pip install glom lenses

# https://discourse.jupyter.org/t/customizing-shell-launched-by-terminal/3412
RUN echo '\
\
\
# My additions\
c.NotebookApp.terminado_settings = { "shell_command": ["/usr/bin/fish"] }\
' >> /etc/jupyter/jupyter_notebook_config.py

#USER jovyan



WORKDIR "${HOME}"

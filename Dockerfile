FROM continuumio/miniconda3

RUN conda update -n base -c defaults -y conda

RUN conda install -n base -y conda-libmamba-solver
RUN conda config --set solver libmamba

RUN conda config --add channels conda-forge
RUN conda config --set channel_priority strict

RUN conda install -n base -c conda-forge -y numpy pandas matplotlib
RUN conda install -n base -c conda-forge -y notebook
RUN conda install -n base -c conda-forge -y scipy ipywidgets jupyter_contrib_nbextensions
RUN jupyter nbextension enable --py widgetsnbextension
RUN conda install -n base -c conda-forge -y nb_black

COPY ./course /course

ENTRYPOINT ["python", "-m", "notebook", "--ip='*'", "--port=80", "--no-browser", "--allow-root", "--NotebookApp.password=''", "--NotebookApp.token=''"]
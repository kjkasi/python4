FROM continuumio/miniconda3

RUN conda update -n base -c defaults -y conda

RUN conda config --remove channels defaults
RUN conda config --add channels conda-forge
RUN conda config --set channel_priority strict
RUN conda update --all -y

# RUN conda update -n base -c conda-forge -y conda

RUN conda install -n base -c conda-forge -y conda-libmamba-solver
RUN conda config --set solver libmamba

RUN conda install -n base -c conda-forge -y numpy
RUN conda install -n base -c conda-forge -y pandas
RUN conda install -n base -c conda-forge -y matplotlib
RUN conda install -n base -c conda-forge -y notebook
RUN conda install -n base -c conda-forge -y scipy
RUN conda install -n base -c conda-forge -y ipywidgets
RUN conda install -n base -c conda-forge -y jupyter_contrib_nbextensions
RUN jupyter nbextension enable --py widgetsnbextension
RUN conda install -n base -c conda-forge -y nb_black
RUN conda install -n base -c conda-forge -y pooch

COPY ./course /course

ENTRYPOINT ["python", "-m", "notebook", "--ip='*'", "--port=80", "--no-browser", "--allow-root", "--NotebookApp.password=''", "--NotebookApp.token=''"]